from django.shortcuts import render
from rest_framework.views import APIView
from auctions.models import General, User
from . import serializers
from rest_framework.response import Response
from rest_framework.authentication import (
    SessionAuthentication,
    BasicAuthentication,
    TokenAuthentication,
)
from rest_framework.permissions import IsAuthenticated, AllowAny
from auctions import models
from django.contrib.auth import get_user_model
from django.forms.models import model_to_dict
from django.contrib.auth.hashers import PBKDF2PasswordHasher
from django.contrib.auth.hashers import make_password # type: ignore
from django.contrib.auth import authenticate
from django.db.models import Q
from ippanel import Client
import random
User = get_user_model()
from django.core.mail import send_mail

from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie, vary_on_headers
# Create your views here.
from django.utils import timezone

class AppSetting(APIView):
    def get(self, request):
        query = models.AppSettings.objects.get()
        serializer = serializers.AppSettingsSerializer(query)
        return Response(serializer.data)
    
        

class Inv(APIView):
    def post(self, request):
        user = User.objects.get(username = request.data['username'])
        user.inv = request.data['key']
        user.save()
        user1 = User.objects.get(ref = request.data['key'])
        user1.level1.add(*[user])
        user1.save()
        if user.inv:
            user2 = User.objects.get(ref = user1.inv)
            user2.level2.add(user1)
            if user.inv:
                user3 = User.objects.get(ref = user2.inv)
                user3.level3.add(user2)
        return Response()
        

class vorood(APIView):
    def post(self, request):
        user = User.objects.get(username = request.data['username'])
        models.timer.objects.filter(user=user) \
                               .update(date=timezone.now())
        models.Notification.objects.create(user=user, text="با موفقیت به حساب خود وارد شدید", title="ورود", read = False)

        # send_mail(
        #     "Subject here",
        #     "Here is the message.",
        #     "noreply@ramabit.com",
        #     ["armansaheb@gmail.com"],
        #     fail_silently=False,
        # )
        return Response()

class OnePlan(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, id):
        query = models.Plans.objects.get(id = id)
        serializer = serializers.PlansSerializer(query)
        return Response(serializer.data)

class Users(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    
    def get(self, request):
        query = User.objects.get(id=request.user.id)
        if len(models.timer.objects.filter(user= query)):
            if (timezone.now() - models.timer.objects.get(user= query).date).total_seconds() / 60 > 30:
                return Response(False)
        serializer = serializers.UserSerializer(query)
        return Response(serializer.data)


class Generals(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [AllowAny]
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request):
        query = General.objects.get()
        serializer = serializers.GeneralSerializer(query)
        return Response(serializer.data)


class Posts(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request):
        query = models.post.objects.all()
        serializer = serializers.PostSerializer(query, many=True)
        return Response(serializer.data)
    


class Newses(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request):
        query = models.News.objects.all()
        serializer = serializers.NewsSerializer(query, many=True)
        return Response(serializer.data)



class VerifyMobile(APIView):
    
    
    def get(self, request):
        user = models.Verify.objects.get(userid= request.user.id)
        vcode = random.randrange(999999)
        user.mobilec = vcode
        user.save()

        api_key = "HpmWk_fgdm_OnxGYeVpNE1kmL8fTKC7Fu0cuLmeXQHM="

        sms = Client(api_key)

        bulk_id = sms.send(
        "+983000505",         
        [f"{request.user.mobile}"],    
        f'به شرکت سرمایه گذاری ... خوش آمدید کد فعالسازی : {vcode} ' 
        )

        message = sms.get_message(bulk_id)
        return Response()
    def post(self, request):
        user= request.user
        if(int(request.POST['code']) == int(user.mobilec)):
            user.mobilev = True
            user.save()
            if (user.melliv == 3 and  user.bankv == 3 and user.emailv == True ):
                user.is_verified = True
            return Response()
        else:
            return Response("کد وارد شده معتبر نیست", status=400)



class Settings(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request):
        query = models.settings.objects.get(id=1)
        serializer = serializers.SettingsSerializer(
            query,
        )
        return Response(serializer.data)


class Pages(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, id):
        query = models.pages.objects.get(id=id)
        serializer = serializers.PagesSerializer(
            query,
        )
        return Response(serializer.data)
        
class Detail(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, id):
        try:
            query = models.Details.objects.get(page=id)
            serializer = serializers.DetailsSerializer(
                query,
            )
            return Response(serializer.data)
        except:
            return Response('')


class Currencies(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request):
        query = models.currencies.objects.all().order_by('align')
        serializer = serializers.CurrencySerializer(query, many=True)
        return Response(serializer.data)


class CurrenciesPic(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, id):
        query = models.currencies.objects.get(id=id)
        serializer = serializers.CurrencyImageSerializer(query)
        return Response(serializer.data)
    
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def post(self, request, id):
        query = models.currencies.objects.get(id=id)
        serializer = serializers.CurrencySerializer(query)
        return Response(serializer.data)



class PlansByCurrencies(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, id):
        query = models.currencies.objects.get(id=id)
        query = models.Plans.objects.filter(currency=query)
        serializer = serializers.PlansSerializer(query, many=True)
        return Response(serializer.data)

class PlansIndex(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, **kwarg):
        query = models.Plans.objects.filter(Q(**kwarg, _connector=Q.OR))
        serializer = serializers.PlansSerializer(query, many=True)
        return Response(serializer.data)

class MinersByCurrencies(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, id=None):
        query = models.currencies.objects.get(id=id)
        query = models.Miners.objects.filter(id=id)
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)
    
class MinersPic(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, brand=None, period=None, id=None):
        if brand :
            query = models.Miners.objects.filter(currency = models.currencies.objects.get(brand = brand))
            serializer = serializers.MinersSerializer(query, many=True)
            return Response(serializer.data)
        if period :
            query = models.Miners.objects.filter(period = int(period))
            serializer = serializers.MinersSerializer(query, many=True)
            return Response(serializer.data)
        if id :
            query = models.Miners.objects.get(id = id)
            serializer = serializers.MinersSerializer(query)
            return Response(serializer.data)
                
        query = models.Miners.objects.all()
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)


class Miners(APIView):
    
    def get(self, request, brand):
        query = models.Miners.objects.filter(currency = models.currencies.objects.get(brand = brand))
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)

class Pages(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request, brand):
        query = models.pages.objects.get(name = brand)
        serializer = serializers.PagesSerializer(query)
        return Response(serializer.data)

class MinersCurrencies(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request):
        mylist = []
        query = models.Miners.objects.all()
        for item in query:
            if not item.currency.brand in mylist:
                mylist.append(item.currency.brand)
        return Response(mylist)



class Wallets(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        wa = []
        for cur in models.currencies.objects.all().order_by('align'):
            if(len(models.wallet.objects.filter(user = request.user , currency= cur))>0):
                wal = models.wallet.objects.filter(user = request.user , currency= cur).last()
                wa.append([cur.get_image() , wal.amount , cur.brand, cur.pk, cur.name, cur.price])
            else:
                wa.append([cur.get_image() , 0 , cur.brand , cur.pk, cur.name, cur.price] )
        return Response(wa)

    def post(self, request, id):
        wa = []
        for cur in models.currencies.objects.filter(id = id):
            if(len(models.wallet.objects.filter(user = request.user , currency= cur))>0):
                wal = models.wallet.objects.get(user = request.user , currency= cur)
                wa.append([cur.get_image() , wal.amount , cur.brand, cur.pk, cur.get_qr(), cur.address])
            else:
                wa.append([cur.get_image() , 0 , cur.brand , cur.pk, cur.get_qr(), cur.address] )
        return Response(wa)

class Profits(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    
    @method_decorator(cache_page(60 * 60 * 1))
    @method_decorator(vary_on_headers("Authorization"))

    def get(self, request):
        pro = []
    
        for eplan in models.profitlist.objects.filter(user = request.user):
            if(eplan.plan ):
                plant = models.Plans.objects.get(id = eplan.plan.id ).title
                cur = models.Plans.objects.get(id = eplan.plan.id ).currency.get_image() 
            else:
                if len(User.objects.filter(id = eplan.invid )) > 0:
                    plant = "زیرمجموعه : "  + User.objects.get(id = eplan.invid ).name + ' ' + User.objects.get(id = eplan.invid ).lastname 
                else :
                    plant = "    زیرمجموعه "  + ' '
                cur = eplan.currency.get_image() 
            pro.append([plant ,eplan.amount,eplan.date,cur])

        return Response(pro)




class Transaction(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def get(self, request):
        trans = []
        transaction = models.Transaction.objects.filter(user = request.user)
        for transa in transaction:
            if transa.act == 0 :
                act = 'برداشت'
                actc = 'red'
            else:
                act = 'واریز'
                actc= 'green'
            trans.append([transa.currency.get_image(), transa.amount,transa.date,act,actc, transa.id, transa.currency.brand, transa.currency.price, int(transa.currency.price * transa.amount)])
        return Response(trans)
    

class Special(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def get(self, request):
        query = models.post.objects.filter(place = 'home'),
        serializer = serializers.PostSerializer(query, many=True)
        return Response(serializer.data)


class ChangePass(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        
        opass = request.data["opassword"]
        passw = request.data["password"]
        repassw = request.data["repassword"]
        user = request.user
        if passw == repassw:
            usercheck = authenticate(request, username=user.username, password=opass)
            if usercheck == None:
                return Response("پسورد فعلی وارد شده غلط است", status= 403)
            passs = make_password(str(passw))
            user.password = passs
            user.save()
            return Response(" با موفقیت انجام شد")
        return render(" تایید پسورد وارد شده غلط است", status = 403)
    



class AddAmountReq(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        link = request.data['link']
        amount = request.data['amount']
        user = request.user
        currency = models.currencies.objects.get(id = request.data['cur'])
        add = models.Addamountreq(link=link , amount = amount ,user = user , currency = currency)
        add.save()
        return Response("با موفقیت انجام شد")
    
    
class AskAmountReq(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        link = request.data['link']
        amount = request.data['amount']
        userid = request.user
        curid = request.data['cur']
        add = models.Askamountreq(link=link , amount = amount ,user = userid , currency = models.currencies.objects.get(id = curid))
        add.save()

        return Response("با موفقیت انجام شد")
    


class BuyPlan(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]

    def post(self, request):
        plan = request.data['plan']
        deposit = request.data['amount']
        option = request.data['option']
        plan = models.Plans.objects.get(id=plan)
        if(len(models.wallet.objects.filter(user = request.user , currency = plan.currency))>0):
            havings = models.wallet.objects.get(user = request.user , currency = plan.currency)
            if (float(deposit) <= float(havings.amount)):
                buy = models.bid.objects.create(user=request.user , plan=plan , deposit=deposit , option = option)
                havings.amount = havings.amount - float(deposit)
                havings.save()
                return Response(
                    "پلن با موفقیت برای شما ثبت شد",
                )
            else:
                return Response(" دارایی کیف پول مربوط به این پلن کافی نیست لطفا کیف پول خود را شارژ کنید",status=400)
        else:
            wal = models.wallet(user = request.user , currency = plan.currency , amount = 0)
            wal.save()
            return Response(" دارایی کیف پول مربوط به این پلن کافی نیست لطفا کیف پول خود را شارژ کنید",
                status=400)

class Plan(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        query = models.bid.objects.filter(user= request.user).order_by('-id')
        serializer = serializers.BidSerializer(query, many=True)
        return Response(serializer.data)


class closeplan(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        bidid = request.data['bidid']
        bids = models.bid.objects.get(id = int(bidid))
        plans = bids.plan
        if plans.period == 'half-year' or plans.period == 'year':
            return Response("برای لغو پلن های شش ماهه و یک ساله تیکت ثبت کنید",status = 400
             )
        else:
            wall = models.wallet.objects.get(user = bids.user.id , currency = plans.currency.id)
            wall.amount = wall.amount + bids.deposit
            wall.save()
            bids.delete()
            
        query = models.bid.objects.filter(user= request.user)
        serializer = serializers.BidSerializer(query, many=True)
        return Response("پلن با موفقیت بسته شد",status = 200
             )


class RentMiner(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        miner = models.Miners.objects.get(id = int(request.data['miner']))
        wallet, _ = models.wallet.objects.get_or_create(user = request.user, currency = models.currencies.objects.get(brand = 'USDT'))
        if miner.price <= wallet.amount:
            wallet.amount = wallet.amount - miner.price
            wallet.save()
            models.RentedMiner.objects.create(miner = miner ,user = request.user)
            return Response()
        else:
            return Response("ابتدا حساب تتر خود را شارژ کنید",status = 400
             )
             
class RentMiners(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        miner = models.Miners.objects.get(id = int(request.data['miner']))
        amount = int(request.data['amount'])
        wallet, _ = models.wallet.objects.get_or_create(user = request.user, currency = models.currencies.objects.get(brand = 'USDT'))
        if miner.price * amount <= wallet.amount:
            for _ in range(amount):
                wallet.amount = wallet.amount - miner.price
                wallet.save()
                models.RentedMiner.objects.create(miner = miner ,user = request.user)
            return Response('اجاره ی ماینر با موفقیت انجام شد')
        else:
            return Response("ابتدا حساب تتر خود را شارژ کنید",status = 400
             )


class Miner(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    @method_decorator(cache_page(60 * 2))
    @method_decorator(vary_on_headers("Authorization"))
    def get(self, request):
        query = models.RentedMiner.objects.filter(user= request.user, done= False)
        serializer = serializers.RentedMinerSerializer(query, many=True)
        return Response(serializer.data)



class Banners(APIView):
    @method_decorator(cache_page(60 * 60 * 2))
    @method_decorator(vary_on_cookie)
    def get(self, request):
        query = models.Banner.objects.all()
        serializer = serializers.BannerSerializer(query, many=True)
        return Response(serializer.data)

class Elans(APIView):
    def get(self, request):
        query = models.Elan.objects.all()
        serializer = serializers.ElanSerializer(query, many=True)
        return Response(serializer.data)

class Subjects(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def get(self, request):
        subject = []
        acts=''
        for item in models.Subjects.objects.filter(user = request.user):
            if item.act == 0 :
                acts = 'در حال بررسی'
            if item.act == 1 :
                acts = 'پاسخ داده شده'
            if item.act == 2 :
                acts = 'پاسخ  مشتری'
            if item.act == 3 :
                acts = 'بسته شده'
            subject.append([item.title , item.date , item.lastdate , acts,item.id , item.read])
            
        return Response(subject)
        

class tickets(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def get(self, request, id):
        query = models.Tickets.objects.filter(subid = id)
        serializer = serializers.TicketsSerializer(query, many=True)
        return Response(serializer.data)
        
class addticket(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        title = request.data['title']
        des = request.data['des']
        subject = models.Subjects(user = request.user , title = title)
        subject.save()
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            ticket = models.Tickets(text = des , pic = pic,subid = subject.id)
        ticket = models.Tickets( text = des ,subid = subject.id)
        ticket.save()
        return Response("تیکت شما با موفقیت ثبت شد"
            )
        
        
class ansticket(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def post(self, request):
        subid = request.data['id']
        des = request.data['des']
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            ticket = Tickets(text = des , pic = pic,subid = subject.id)
        ticket = models.Tickets( text = des ,subid = subid)
        ticket.save()
        sub = models.Subjects.objects.get(id = subid)
        sub.act = 2
        sub.aread = False
        sub.save()
        query = models.Tickets.objects.filter(subid = subid)
        serializer = serializers.TicketsSerializer(query, many=True)
        return Response(serializer.data)
            
class aansticket(APIView):
    def post(self, request):
        subid = request.data['id']
        des = request.data['des']
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            ticket = models.Tickets(text = des , pic = pic,subid = subject.id,sender=1)
        ticket = models.Tickets( text = des ,subid = subid, sender=1)
        ticket.save()
        sub = models.Subjects.objects.get(id = subid)
        sub.act = 1
        sub.read = False
        sub.save()
        return Response("تیکت شما با موفقیت ثبت شد"
            )
            
            
class forgetreq(APIView):
    def post(self, request):
        email = request.data['email']
        if(len(User.objects.filter(email = email))<1):
            return Response("کاربر با ایمیل وارد شده یافت نشد",
                status = 403
        )
        serializer = models.Forget(email=email)
        serializer.save()
        
        key = models.Forget.objects.filter(email = email).reverse()[0].key
        response_data = {}
        response_data['result'] = 'Create post successful!'
        send_mail(
        'Subject here',
        f'لینک بازیابی رمز عبور شما : http://ramabit.com/resetpass/{key} ',
        'noreply@ramabit.com',
        [f'{email}'],
        fail_silently=False,
        )
        return Response()
        
class resetpass(APIView):
        
    def post(self, request):
        key = request.data['key']
        if(len(models.Forget.objects.filter(key = key))<1):
            return Response("لینک استفاده شده معتبر نیست"
        ,status = 403)
        user = User.objects.get(email = models.Forget.objects.get(key = request.data['key']).email)
        passw = request.data['password']
        repassw = request.data['repassword']
        if passw == repassw:
            passs = make_password(str(passw))
            user.password = passs
            user.save()
            models.Forget.objects.get(key = key).delete()
            return Response()
        else:
            return Response('کلمه عبور با تکرار برابر نیست',status = 403)
            

class Notifications(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]
    def get(self, request):
        query = models.Notification.objects.filter(user = request.user).order_by('-id')
        serializer = serializers.NotificationSerializer(query, many=True)
        return Response(serializer.data)
    def post(self, request):
        query = models.Notification.objects.filter(user = request.user)
        for item in query:
            item.read = True
            item.save()
        serializer = serializers.NotificationSerializer(query, many=True)
        return Response(serializer.data)

