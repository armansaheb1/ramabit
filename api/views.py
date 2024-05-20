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

# Create your views here.


class Users(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        query = User.objects.get(id=request.user.id)
        serializer = serializers.UserSerializer(query)
        return Response(serializer.data)


class Generals(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [AllowAny]

    def get(self, request):
        query = General.objects.get()
        serializer = serializers.GeneralSerializer(query)
        return Response(serializer.data)


class Posts(APIView):
    def get(self, request):
        query = models.post.objects.all()
        serializer = serializers.PostSerializer(query, many=True)
        return Response(serializer.data)
    


class Newses(APIView):
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
    def get(self, request):
        query = models.settings.objects.get(id=1)
        serializer = serializers.SettingsSerializer(
            query,
        )
        return Response(serializer.data)


class Pages(APIView):
    def get(self, request, id):
        query = models.pages.objects.get(id=id)
        serializer = serializers.PagesSerializer(
            query,
        )
        return Response(serializer.data)


class Currencies(APIView):
    def get(self, request):
        query = models.currencies.objects.all()
        serializer = serializers.CurrencySerializer(query, many=True)
        return Response(serializer.data)


class CurrenciesPic(APIView):
    def get(self, request, id):
        query = models.currencies.objects.get(id=id)
        serializer = serializers.CurrencyImageSerializer(query)
        return Response(serializer.data)

    def post(self, request, id):
        query = models.currencies.objects.get(id=id)
        serializer = serializers.CurrencySerializer(query)
        return Response(serializer.data)



class PlansByCurrencies(APIView):
    def get(self, request, id):
        query = models.currencies.objects.get(id=id)
        query = models.Plans.objects.filter(currency=query)
        serializer = serializers.PlansSerializer(query, many=True)
        return Response(serializer.data)

class PlansIndex(APIView):
    def get(self, request, **kwarg):
        query = models.Plans.objects.filter(Q(**kwarg, _connector=Q.OR))
        serializer = serializers.PlansSerializer(query, many=True)
        return Response(serializer.data)

class MinersByCurrencies(APIView):
    def get(self, request, id=None):
        query = models.currencies.objects.get(id=id)
        query = models.Miners.objects.filter(id=id)
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)
    
class MinersPic(APIView):
    def get(self, request, brand=None):
        if not brand :
            query = models.Miners.objects.all()
            serializer = serializers.MinersSerializer(query, many=True)
            return Response(serializer.data)
        query = models.Miners.objects.filter(currency = models.currencies.objects.get(brand = brand))
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)


class Miners(APIView):
    def get(self, request, brand):
        query = models.Miners.objects.filter(currency = models.currencies.objects.get(brand = brand))
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)

class Pages(APIView):
    def get(self, request, brand):
        query = models.pages.objects.get(name = brand)
        serializer = serializers.PagesSerializer(query)
        return Response(serializer.data)

class MinersCurrencies(APIView):
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
        for cur in models.currencies.objects.all():
            if(len(models.wallet.objects.filter(user = request.user , currency= cur))>0):
                wal = models.wallet.objects.get(user = request.user , currency= cur)
                wa.append([cur.get_image() , wal.amount , cur.brand, cur.pk, cur.name, cur.price])
            else:
                wa.append([cur.get_image() , 0 , cur.brand , cur.pk, cur.name, cur.price] )
        return Response(wa)

    def post(self, request, id):
        wa = []
        for cur in models.currencies.objects.filter(id = id):
            if(len(models.wallet.objects.filter(user = request.user , currency= cur))>0):
                wal = models.wallet.objects.get(user = request.user , currency= cur)
                wa.append([cur.get_image() , wal.amount , cur.brand, cur.pk])
            else:
                wa.append([cur.get_image() , 0 , cur.brand , cur.pk] )
        return Response(wa)

class Profits(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        pro = []
    
        for eplan in models.profitlist.objects.filter(user = request.user):
            if(models.Plans.objects.filter(id = eplan.planid )):
                plant = models.Plans.objects.get(id = eplan.planid ).title
                cur = models.Plans.objects.get(id = eplan.planid ).currency.pic 
            else:
                if len(User.objects.filter(id = eplan.invid )) > 0:
                    plant = " سود حاصل از زیرمجموعه : "  + User.objects.get(id = eplan.invid ).name + ' ' + User.objects.get(id = eplan.invid ).lastname 
                else :
                    plant = " سود حاصل از زیرمجموعه : "  + 'کاربر وجود ندارد'
                cur = eplan.currency.pic 
            pro.append([User.objects.get(id = eplan.user).name + User.objects.get(id = eplan.user).lastname , plant ,eplan.amount,eplan.date,cur])

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
        transaction = models.Transactions.objects.filter(user = request.user)
        for transa in transaction:
            if transa.act == 0 :
                act = 'برداشت'
                actc = 'red'
            else:
                act = 'واریز'
                actc= 'green'
            trans.append([transa.currency.get_image(), transa.amount,transa.date,act,actc])
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
            wal = models.wallet(user = request.user , currency = cur , amount = 0)
            wal.save()
            return render(" دارایی کیف پول مربوط به این پلن کافی نیست لطفا کیف پول خود را شارژ کنید",
                status=400)


class Plan(APIView):
    authentication_classes = [
        SessionAuthentication,
        BasicAuthentication,
        TokenAuthentication,
    ]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        query = models.bid.objects.filter(user= request.user)
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
        return Response(serializer.data)

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
            models.RentedMiner.objects.create(miner = miner ,user = request.user)
            return Response()
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
    def get(self, request):
        query = models.RentedMiner.objects.filter(user= request.user, done= False)
        serializer = serializers.RentedMinerSerializer(query, many=True)
        return Response(serializer.data)



class Banners(APIView):
    def get(self, request):
        query = models.Banner.objects.all()
        serializer = serializers.BannerSerializer(query, many=True)
        return Response(serializer.data)

class Elans(APIView):
    def get(self, request):
        query = models.Elan.objects.all()
        serializer = serializers.ElanSerializer(query, many=True)
        return Response(serializer.data)

