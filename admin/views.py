from django.shortcuts import render
from auctions import models
from . import serializers
from rest_framework.response import Response
from rest_framework.authentication import (
    SessionAuthentication,
    BasicAuthentication,
    TokenAuthentication,
)
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from api import serializers as aucserializers
from django.contrib.auth.hashers import make_password

addamountreq = []
askamountreq = []
trans = []
eplans = []
pro = []
transaction = models.Transaction.objects.all()


class UserToken(APIView):
    def get(self, request, id):
        user = models.User.objects.get(id = id)
        token, _ = Token.objects.get_or_create(user=user)
        return Response(token.key)
    def put(self, request, id):
        user = models.User.objects.get(id = id)
        user.is_active = not user.is_active
        user.save()
        return Response()
    def delete(self, request, id):
        user = models.User.objects.get(id = id)
        user.delete()
        return Response()


class Users(APIView):
    def get(self, request):
        query = models.User.objects.all()
        serializer = serializers.UserSerializer(query, many=True)
        return Response(serializer.data)

class Transaction(APIView):
    def get(self, request):
        query = models.Transaction.objects.all()
        serializer = serializers.TransactionsSerializer(query, many=True)
        return Response(serializer.data)
    
class Miners(APIView):
    def get(self, request):
        query = models.RentedMiner.objects.filter(done=False)
        serializer = serializers.RentedMinerSerializer(query, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        query = models.RentedMiner.objects.filter(done=True)
        serializer = serializers.RentedMinerSerializer(query, many=True)
        return Response(serializer.data)
    
    
class Profit(APIView):
    def get(self, request):
        query = models.profitlist.objects.all()
        serializer = serializers.profitlistSerializer(query, many=True)
        return Response(serializer.data)
    
    
# Create your views here.
class Mellis(APIView):
    def get(self, request):
        query = models.Adminverifymelli.objects.filter(action = 0)
        serializer = serializers.AdminverifymelliSerializer(query, many=True)
        return Response(serializer.data)

    def put(self, request, id):
        req = models.Adminverifymelli.objects.get(id = id)
        user = models.Verify.objects.get(user = req.user)
        user.melliv = 3
        user.save()
        
        req.action = True
        req.save()
        if (user.bankv == 3  and user.mobilev == True  and user.emailv == True ):
            per = req.user
            per.is_verified = True
        return Response()
    def delete(self, request, id):
        req = models.Adminverifymelli.objects.get(id = id)
        user = models.Verify.objects.get(user = req.user)
        user.melliv = 3
        user.save()
        
        req.action = True
        req.save()
        if (user.bankv == 3  and user.mobilev == True  and user.emailv == True ):
            per = req.user
            per.is_verified = True
        return Response()
    
class Banks(APIView):
    def get(self, request):
        query = models.Adminverifybank.objects.filter(action = 0)
        serializer = serializers.AdminverifybankSerializer(query, many=True)
        return Response(serializer.data)

    def put(self, request, id):
        req = models.Adminverifybank.objects.get(id = id)
        user = models.Verify.objects.get(user = req.user)
        user.melliv = 3
        user.save()
        
        req.action = True
        req.save()
        if (user.bankv == 3  and user.mobilev == True  and user.emailv == True ):
            per = req.user
            per.is_verified = True
        return Response()
    def delete(self, request, id):
        req = models.Adminverifybank.objects.get(id = id)
        user = models.Verify.objects.get(user = req.user)
        user.melliv = 3
        user.save()
        
        req.action = True
        req.save()
        if (user.bankv == 3  and user.mobilev == True  and user.emailv == True ):
            per = req.user
            per.is_verified = True
        return Response()
    

class Banks(APIView):
    def get(self, request):
        query = models.Adminverifybank.objects.all()
        serializer = serializers.AdminverifybankSerializer(query, many=True)
        return Response(serializer.data)
    

class Addamountreqs(APIView):
    def get(self, request):
        query = models.Addamountreq.objects.all()
        serializer = serializers.AddamountreqSerializer(query, many=True)
        return Response(serializer.data)
    
    def put(self, request, id):
        req = models.Addamountreq.objects.get(id = id)
        set = models.settings.objects.all()[0]
        if(models.wallet.objects.filter(user = req.user , currency = req.currency)):
            wal = models.wallet.objects.get(user = req.user , currency = req.currency)
            wal.amount = float(wal.amount) + float(req.amount)
            wal.save()
            req.delete()
            trans = models.Transaction(user = req.user , currency = req.currency ,amount = req.amount , act = 1)
            trans.save()
        else:
            wal = models.wallet(user = req.user , currency = req.currency , amount = req.amount)
            wal.save()
            req.delete()
            trans = models.Transaction(user = req.user , currency = req.currency ,amount = req.amount , act = 1)
            trans.save()
        if(models.User.objects.get(id = req.user.id).inv):
            firstinv = models.User.objects.get(ref = models.User.objects.get(id = req.user.id).inv)
            if(models.wallet.objects.filter(user = firstinv.id , currency = req.currency)):
                wal2 = models.wallet.objects.get(user = firstinv.id , currency = req.currency)
                wal2.amount = float(wal2.amount) + float(req.amount)* 0.02
                wal2.save()
                trans = models.profitlist(user = firstinv ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)* 0.02)
                trans.save()
            else:
                wal2 = models.wallet(user = firstinv , currency = req.currency , amount = float(req.amount)*  0.02)
                wal2.save()
                trans = models.profitlist(user = firstinv ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)*   0.02)
                trans.save()     
            if(firstinv.inv):
                secondinv = models.User.objects.get(ref = firstinv.inv)
                if(models.wallet.objects.filter(user = secondinv , currency = req.currency)):
                    wal3 = models.wallet.objects.get(user = secondinv , currency = req.currency)
                    wal3.amount = float(wal3.amount) + float(req.amount)* 0.01
                    wal3.save()
                    trans = models.profitlist(user = secondinv ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)* 0.01 )
                    trans.save()
                else:
                    wal3 = models.wallet(user = secondinv , currency = req.currency , amount = float(req.amount)* 0.01)
                    wal3.save()
                    trans = models.profitlist(user = secondinv ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)* 0.01 )
                    trans.save()
                if(secondinv.inv):
                    thirdinv = models.User.objects.get(ref = secondinv.inv)
                    if(models.wallet.objects.filter(user = thirdinv , currency = req.currency)):
                        wal4 = models.wallet.objects.get(user = thirdinv , currency = req.currency)
                        wal4.amount = float(wal4.amount) + float(req.amount)* 0.005
                        wal4.save()
                        trans = models.profitlist(user = thirdinv ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)* 0.005 )
                        trans.save()
                    else:
                        wal4 = models.wallet(user = thirdinv , currency = req.currency , amount = float(req.amount)* 0.005)
                        wal4.save()
                        trans = models.profitlist(user = thirdinv ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)* 0.005 )
                        trans.save()
                        if(thirdinv.inv):
                            fourth = models.User.objects.get(ref = thirdinv.inv)
                            if(models.wallet.objects.filter(user = fourth , currency = req.currency)):
                                wal5 = models.wallet.objects.get(user = fourth , currency = req.currency)
                                wal5.amount = float(wal5.amount) + float(req.amount)* 0.0025
                                wal5.save()
                                trans = models.profitlist(user = fourth ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)* 0.0025 )
                                trans.save()
                            else:
                                wal5 = models.wallet(user = fourth , currency = req.currency , amount = float(req.amount)* 0.0025)
                                wal5.save()
                                trans = models.profitlist(user = fourth ,invid = req.user.id, currency = req.currency ,amount = float(req.amount)* 0.0025 )
                                trans.save()
        query = models.Addamountreq.objects.all()
        serializer = serializers.AddamountreqSerializer(query, many=True)
        return Response(serializer.data)

    def delete(self, request, id):
        req = models.Addamountreq.objects.get(id = id)
        req.delete()
        query = models.Addamountreq.objects.all()
        serializer = serializers.AddamountreqSerializer(query, many=True)
        return Response(serializer.data)
    

    

class Askamountreqs(APIView):
    def get(self, request):
        query = models.Askamountreq.objects.all()
        serializer = serializers.AskamountreqSerializer(query, many=True)
        return Response(serializer.data)
    
    def put(self, request, id):
        req = models.Askamountreq.objects.get(id = id)
        wal = models.wallet.objects.get(user = req.user , currency = req.currency)
        wal.amount = float(wal.amount) - float(req.amount)
        wal.save()
        req.delete()
        trans = models.Transaction(user = req.user , currency =req.currency ,amount = req.amount , act = 2)
        trans.save()
        query = models.Askamountreq.objects.all()
        serializer = serializers.AskamountreqSerializer(query, many=True)
        return Response(serializer.data)

    def delete(self, request, id):
        req = models.Askamountreq.objects.get(id = id)
        req.delete()
        query = models.Askamountreq.objects.all()
        serializer = serializers.AskamountreqSerializer(query, many=True)
        return Response(serializer.data)
    

        

class Plan(APIView):
    def get(self, request):
        query = models.Plans.objects.all()
        serializer = serializers.PlansSerializer(query, many=True)
        return Response(serializer.data)
    
    
    

class Profits(APIView):
    def get(self, request):
        pro = []
        for eplan in models.profitlist.objects.all():
        
            if eplan.plan:
                plant = eplan.plan
                cur = eplan.plan.currency.pic 
            else:
                if(len(models.User.objects.filter(id = eplan.invid ))>0):
                    plant = " سود حاصل از زیرمجموعه : "  + models.User.objects.get(id = eplan.invid ).name + ' ' + models.User.objects.get(id = eplan.invid ).lastname 
                    cur = models.currencies.objects.get(id = eplan.currency.id).pic 
                else:
                    plant = " سود حاصل از زیرمجموعه  " 
                    cur = models.currencies.objects.get(id = eplan.currency.id).pic 
            pro.append([models.User.objects.get(id = eplan.user.id).name + models.User.objects.get(id = eplan.user.id).lastname , plant ,eplan.amount,eplan.date,cur])
        Response(pro)
    

class Subject(APIView):
    def get(self, request):

        subject = []
        for item in models.Subjects.objects.all().order_by('aread','-lastdate'):
            if item.act == 0 :
                acts = 'در حال بررسی'
            if item.act == 1 :
                acts = 'پاسخ داده شده'
            if item.act == 2 :
                acts = 'پاسخ  مشتری'
            if item.act == 3 :
                acts = 'بسته شده'
            subject.append([item.title , item.date , item.lastdate , acts,item.id , models.User.objects.get(id = item.user.id).username,item.aread])
        unread = 0 
        for item in models.Subjects.objects.filter(user = request.user , aread = False):
            unread = unread + 1

        Response({'subject' : subject, 'unread' : unread})

class verifymellicheck(APIView):
    def post(self, request):

        user = request.data['userid']
        idm = request.data['idm']
        ans = request.data['ans']
        user = models.Verify.objects.get(user = req.user)
        user.melliv = ans
        user.save()
        req = models.Adminverifymelli.objects.get(id = idm)
        req.action = True
        req.save()
        if (user.bankv == 3  and user.mobilev == True  and user.emailv == True ):
            per = req.user
            per.is_verified = True
        Response()



class verifybankcheck(APIView):
    def post(self, request):
        user = request.data['userid']
        idm = request.data['idm']
        ans = request.data['ans']
        user = models.Verify.objects.get(user = req.user)
        user.bankv = ans
        user.save()
        req = models.Adminverifybank.objects.get(id = idm)
        req.action = True
        req.save()
        if (user.melliv == 3 and models.user.mobilev == True  and models.user.emailv == True ):
            per = req.user
            per.is_verified = True
        return Response()


class verifybank(APIView):
    def post(self, request):
        img = request.FILES['bankimg']
        code = request.data['bank']
        models.Adminverifybank.objects.create(bankimg = img , bankc = code)
        return Response()
    

class deletecur(APIView):
    def post(self, request):
        iden = request.data['id']
        cur = models.currencies.objects.get(id = iden)
        cur.delete()
        return Response()
    


class amountreqcheck(APIView):
    def post(self, request):
        amount = request.data['amount']
        user = request.data['userid']
        curid = request.data['curid']
        ans = request.data['ans']
        idm = request.data['idm']
        set = models.settings.objects.all()[0]
        if(int(ans) == 2):
            req = models.Addamountreq.objects.get(id = idm)
            req.delete()
            return Response()
        if(models.wallet.objects.filter(user = req.user , currency = models.currencies.objects.get(id = curid))):
            wal = models.wallet.objects.get(user = req.user , currency = models.currencies.objects.get(id = curid))
            wal.amount = float(wal.amount) + float(amount)
            wal.save()
            req = models.Addamountreq.objects.get(id = idm)
            req.delete()
            trans = models.Transaction(user = req.user , currency = models.currencies.objects.get(id = curid) ,amount = amount , act = 1)
            trans.save()
        else:
            wal = models.wallet(user = req.user , currency = models.currencies.objects.get(id = curid) , amount = amount)
            wal.save()
            req = models.Addamountreq.objects.get(id = idm)
            req.delete()
            trans = models.Transaction(user = req.user , currency = models.currencies.objects.get(id = curid) ,amount = amount , act = 1)
            trans.save()
        if(models.User.objects.get(id = req.user).inv):
            firstinv = models.User.objects.get(ref = models.User.objects.get(id = req.user).inv)
            if(models.wallet.objects.filter(user = firstinv.id , currency = models.currencies.objects.get(id = curid))):
                wal2 = models.wallet.objects.get(user = firstinv.id , currency = models.currencies.objects.get(id = curid))
                wal2.amount = float(wal2.amount) + float(amount)* 0.02
                wal2.save()
                trans = models.profitlist(user = firstinv.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)* 0.02)
                trans.save()
            else:
                wal2 = models.wallet(user = firstinv.id , currency = models.currencies.objects.get(id = curid) , amount = float(amount)*  0.02)
                wal2.save()
                trans = models.profitlist(user = firstinv.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)*   0.02)
                trans.save()     
            if(firstinv.inv):
                secondinv = models.User.objects.get(ref = firstinv.inv)
                if(models.wallet.objects.filter(user = secondinv.id , currency = models.currencies.objects.get(id = curid))):
                    wal3 = models.wallet.objects.get(user = secondinv.id , currency = models.currencies.objects.get(id = curid))
                    wal3.amount = float(wal3.amount) + float(amount)* 0.01
                    wal3.save()
                    trans = models.profitlist(user = secondinv.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)* 0.01 )
                    trans.save()
                else:
                    wal3 = models.wallet(user = secondinv.id , currency = models.currencies.objects.get(id = curid) , amount = float(amount)* 0.01)
                    wal3.save()
                    trans = models.profitlist(user = secondinv.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)* 0.01 )
                    trans.save()
                if(secondinv.inv):
                    thirdinv = models.User.objects.get(ref = secondinv.inv)
                    if(models.wallet.objects.filter(user = thirdinv.id , currency = models.currencies.objects.get(id = curid))):
                        wal4 = models.wallet.objects.get(user = thirdinv.id , currency = models.currencies.objects.get(id = curid))
                        wal4.amount = float(wal4.amount) + float(amount)* 0.005
                        wal4.save()
                        trans = models.profitlist(user = thirdinv.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)* 0.005 )
                        trans.save()
                    else:
                        wal4 = models.wallet(user = thirdinv.id , currency = models.currencies.objects.get(id = curid) , amount = float(amount)* 0.005)
                        wal4.save()
                        trans = models.profitlist(user = thirdinv.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)* 0.005 )
                        trans.save()
                        if(thirdinv.inv):
                            fourth = models.User.objects.get(ref = thirdinv.inv)
                            if(models.wallet.objects.filter(user = fourth.id , currency = models.currencies.objects.get(id = curid))):
                                wal5 = models.wallet.objects.get(user = fourth.id , currency = models.currencies.objects.get(id = curid))
                                wal5.amount = float(wal5.amount) + float(amount)* 0.0025
                                wal5.save()
                                trans = models.profitlist(user = fourth.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)* 0.0025 )
                                trans.save()
                            else:
                                wal5 = models.wallet(user = fourth.id , currency = models.currencies.objects.get(id = curid) , amount = float(amount)* 0.0025)
                                wal5.save()
                                trans = models.profitlist(user = fourth.id ,invid = req.user, currency = models.currencies.objects.get(id = curid) ,amount = float(amount)* 0.0025 )
                                trans.save()
        return Response()


class askamountreqcheck(APIView):
    def post(self, request):
        amount = request.data['amount']
        user = request.data['userid']
        curid = request.data['curid']
        ans = request.data['ans']
        idm = request.data['idm']
        if(int(ans) == 2):
            req = models.Askamountreq.objects.get(id = idm)
            req.delete()
            return Response()
        wal = models.wallet.objects.get(user = req.user , currency = models.currencies.objects.get(id = curid))
        wal.amount = float(wal.amount) - float(amount)
        wal.save()
        req = models.Askamountreq.objects.get(id = idm)
        req.delete()
        trans = models.Transaction(user = req.user , currency = models.currencies.objects.get(id = curid) ,amount = amount , act = 2)
        trans.save()
        return Response


class setting(APIView):
    def post(self, request):
        name = request.data['name']
        tel = request.data['phone']
        address = request.data['address']
        email = request.data['email']
        instagram = request.data['instagram']
        telegram = request.data['telegram']
        whatsapp = request.data['whatsapp']
        facebook = request.data['facebook']
        s1 = request.data['s1']
        s2 = request.data['s2']
        s3 = request.data['s3']
        s4 = request.data['s4']
        po = models.settings.objects.get(id=1)
        if 'pic' in request.FILES:
            logo = request.FILES['logo']
            po.logo = logo
        po.name = name 
        po.tel = tel 
        po.address = address 
        po.email = email 
        po.telegram = telegram 
        po.whatsapp = whatsapp 
        po.instagram = instagram 
        po.facebook = facebook
        po.s1 = s1
        po.s2 = s2
        po.s3 = s3
        po.s4 = s4
        po.save()
        return Response()
    


class post(APIView):
        def post(self, request):
                title = request.data['title']
                des = request.data['des']
                po = models.post.objects.get(id = id)
                po.title = title 
                po.text = des 
                po.save()
                return Response()
        def get(self, request):
            auc = models.post.objects.get(id = id)
            serializer = serializers.PostSerializer(auc)
            return Response(serializer)
        
        def delete(self, request, id):
            auc = models.post.objects.get(id = id)
            auc.delete()
            return Response()
        


class adminincrease(APIView):
    def post(self, request):
        amount = request.data["amount"]
        curid = request.data["cur"]
        user = models.User.objects.get(id = request.data["userid"])
        
        if(models.wallet.objects.filter(user = user , currency = models.currencies.objects.get(id = curid))):
            wal = models.wallet.objects.get(user = user , currency = models.currencies.objects.get(id = curid))
            wal.amount = float(wal.amount) + float(amount)
            wal.save()
            trans = models.Transaction(user = user , currency = models.currencies.objects.get(id = curid) ,amount = amount , act = 1)
            trans.save()
        else:
            wal = models.wallet(user = user , currency = models.currencies.objects.get(id = curid) , amount = amount)
            wal.save()
            trans = models.Transaction(user = user , currency = models.currencies.objects.get(id = curid) ,amount = amount , act = 1)
            trans.save()
        return Response()


class admindecrease(APIView):
    def post(self, request):
        amount = request.data["amount"]
        curid = request.data["cur"]
        user = models.User.objects.get(id = request.data["userid"])
        
        
        if(models.wallet.objects.filter(user = user , currency = models.currencies.objects.get(id = curid))):
            wal = models.wallet.objects.get(user = user , currency = models.currencies.objects.get(id = curid))
            wal.amount = float(wal.amount) - float(amount)
            wal.save()
            trans = models.Transaction(user = user , currency = models.currencies.objects.get(id = curid) ,amount = amount , act = 2)
            trans.save()
        else:
            return Response(status=400)
        return Response()
    


class adminverify(APIView):
    def post(self, request):
        userid=request.data['userid']
        act=request.data['act']
        user = models.Verify.objects.get(user = user)
        per = models.User.objects.get(id = user)

        if int(act) == 1 :
            user.mobilev = True
            user.save()
            if (user.melliv == 3 and  user.bankv == 3 and user.emailv == True ):
                
                per.is_verified = True

            return Response()
        if int(act) == 2 :
            user.emailv = True
            user.save()
            if (user.melliv == 3 and  user.bankv == 3 and user.mobilev == True ):
                
                per.is_verified = True
            return Response()

        if int(act) == 3 :
            user.melliv = 3
            user.save()
            if (user.emailv == 3 and  user.bankv == 3 and user.mobilev == True ):
                
                per.is_verified = True
            return Response()

        if int(act) == 4 :
            user.bankv = 3
            user.save()
            if (user.emailv == 3 and  user.melliv == 3 and user.mobilev == True ):
                
                per.is_verified = True
            return Response()

        if int(act) == 5 :
            user.bankv = 3
            user.mobilev = True
            user.emailv = True
            user.melliv = 3
            user.save()
            
            per.is_verified = True
            per.save()
            return Response()
        return Response(status=400)
    

class cur(APIView):
    def get(self, request, id = False):
        if id :
            query = models.currencies.objects.get(id = id)
            serializer = serializers.CurrencySerializer(query)
            return Response(serializer.data)
        query = models.currencies.objects.all()
        serializer = serializers.CurrencySerializer(query, many = True)
        return Response(serializer.data)
    def post(self, request):
        name = request.data['name']
        brand = request.data['brand']
        pic = request.FILES['pic']
        qr = request.FILES['qr']
        address = request.data['address']
        auc = models.currencies(name = name , pic = pic , qr = qr , address = address,brand = brand)
        auc.save()
        return Response()
    
    def put(self, request, id):
        name = request.data['name']
        brand = request.data['brand']
        
        
        address = request.data['address']
        auc = models.currencies.objects.get(id = id)
        auc.name = name
        auc.brand = brand
        if 'pic' in request.data :
            pic = request.FILES['pic']
            auc.pic = pic
        if 'qr' in request.data :
            qr = request.FILES['qr']
            auc.qr = qr
        auc.address = address
        auc.save()
        return Response()

    def delete(self, request, id):
        auc = models.currencies.objects.get(id = id)
        auc.delete()
        query = models.currencies.objects.all()
        serializer = serializers.CurrencySerializer(query, many = True)
        return Response(serializer.data)


class plan(APIView):
    def get(self, request, id=False):
        if id :
            query = models.Plans.objects.get(id = id)
            serializer = serializers.PlansSerializer(query)
            return Response(serializer.data)
        auc = models.Plans.objects.all()
        serializer = serializers.PlansSerializer(auc, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        title = request.data['title']
        cur = request.data['cur']
        des = request.data['des']
        percent = request.data['percentm']
        period = request.data['period']
        auc = models.Plans(title = title , des = des , percent = percent , period = period , currency=models.currencies.objects.get(id = cur))
        auc.save()
        return Response()

    def put(self, request, id):
        cur = request.data['cur']
        auc = models.Plans.objects.get(id = id)
        auc.title = request.data['title']
        auc.currency=models.currencies.objects.get(id = cur)
        auc.des = request.data['des']
        auc.percent = request.data['percentm']
        auc.period = request.data['period']
        auc.save()
        return Response()
        
    def delete(self, request, id):
        auc = models.Plans.objects.get(id = id)
        auc.delete()
        auc = models.Plans.objects.all()
        serializer = serializers.PlansSerializer(auc, many=True)
        return Response(serializer.data)



class miner(APIView):
    def get(self, request, id=False):
        if id :
            query = models.Miners.objects.get(id = id)
            serializer = serializers.MinersSerializer(query)
            return Response(serializer.data)
        auc = models.Miners.objects.all()
        serializer = serializers.MinersSerializer(auc, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        title = request.data['title']
        cur = request.data['cur']
        des = request.data['des']
        price = request.data['price']
        profit = request.data['profit']
        rate = request.data['rate']
        period = request.data['period']
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            auc = models.Miners(title = title , des = des , period = period , currency=models.currencies.objects.get(id = cur), price=price, rate=rate, profit=profit, pic= pic)
            auc.save()
            return Response()
        auc = models.Miners(title = title , des = des , period = period , currency=models.currencies.objects.get(name = cur), price=price, rate=rate, profit=profit)
        auc.save()
        return Response()

    def put(self, request, id):
        auc = models.Miners.objects.get(id = id)
        auc.title = request.data['title']
        cur = request.data['cur']
        auc.currency=models.currencies.objects.get(id = cur)
        auc.des = request.data['des']
        auc.price = request.data['price']
        auc.profit = request.data['profit']
        auc.rate = request.data['rate']
        auc.period = request.data['period']
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            auc.pic = pic
            auc.save()
            return Response()
        auc.save()
        return Response()
        
    def delete(self, request, id):
        auc = models.Miners.objects.get(id = id)
        auc.delete()
        auc = models.Miners.objects.all()
        serializer = serializers.MinersSerializer(auc, many=True)
        return Response(serializer.data)


class post(APIView):
    def get(self, request, id=False):
        if id :
            query = models.post.objects.get(id = id)
            serializer = serializers.PostSerializer(query)
            return Response(serializer.data)
        auc = models.post.objects.all()
        serializer = serializers.PostSerializer(auc, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        title = request.data['title']
        text = request.data['text']
        if request.data['index'] == 'false':
            index = False
        else:
            index = True
        if request.data['app'] == 'false':
            app = False
        else:
            app = True

        auc = models.post(title = title, text = text, index=index, app =app)
        pic = request.FILES['pic']
        auc.pic = pic
        auc.save()
        return Response()

    def put(self, request, id):
        auc = models.post.objects.get(id = id)
        auc.title = request.data['title']
        auc.text = request.data['text']
        if request.data['index'] == 'false':
            auc.index = False
        else:
            auc.index = True
        if request.data['app'] == 'false':
            auc.app = False
        else:
            auc.app = True

        if 'pic' in request.data :
            pic = request.FILES['pic']
            auc.pic = pic
        auc.save()
        return Response()
        
    def delete(self, request, id):
        auc = models.post.objects.get(id = id)
        auc.delete()
        auc = models.post.objects.all()
        serializer = serializers.PostSerializer(auc, many=True)
        return Response(serializer.data)



class product(APIView):
    def get(self, request, id=False):
        if id :
            query = models.Product.objects.get(id = id)
            serializer = serializers.ProductSerializer(query)
            return Response(serializer.data)
        auc = models.Product.objects.all()
        serializer = serializers.ProductSerializer(auc, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        title = request.data['title']
        des = request.data['des']
        auc = models.Product(title = title, des = des)
        pic = request.FILES['pic']
        auc.pic = pic
        auc.save()
        return Response()

    def put(self, request, id):
        auc = models.Product.objects.get(id = id)
        auc.title = request.data['title']
        auc.des = request.data['des']
        if 'pic' in request.data :
            pic = request.FILES['pic']
            auc.pic = pic
        auc.save()
        return Response()
        
    def delete(self, request, id):
        auc = models.Product.objects.get(id = id)
        auc.delete()
        auc = models.Product.objects.all()
        serializer = serializers.ProductSerializer(auc, many=True)
        return Response(serializer.data)


class Pages(APIView):
    def get(self, request, id=False):
        if id :
            query = models.pages.objects.get(id = id)
            serializer = serializers.PagesSerializer(query)
            return Response(serializer.data)
        auc = models.pages.objects.all()
        serializer = serializers.PagesSerializer(auc, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        title = request.data['title']
        text = request.data['text']
        auc = models.pages(title = title, text = text)
        pic = request.FILES['pic']
        auc.pic = pic
        auc.save()
        return Response()

    def put(self, request, id):
        auc = models.pages.objects.get(id = id)
        auc.title = request.data['title']
        auc.text = request.data['text']
        auc.save()
        return Response()
        
    def delete(self, request, id):
        auc = models.pages.objects.get(id = id)
        auc.delete()
        auc = models.pages.objects.all()
        serializer = serializers.PagesSerializer(auc, many=True)
        return Response(serializer.data)


class Subjects(APIView):

    def get(self, request):
        subject = []
        acts=''
        for item in models.Subjects.objects.all():
            if item.act == 0 :
                acts = 'در حال بررسی'
            if item.act == 1 :
                acts = 'پاسخ داده شده'
            if item.act == 2 :
                acts = 'پاسخ  مشتری'
            if item.act == 3 :
                acts = 'بسته شده'
            subject.append([item.title , item.date , item.lastdate , acts,item.id , item.read, item.user.username])
            
        return Response(subject)
        
class tickets(APIView):

    def get(self, request, id):
        query = models.Tickets.objects.filter(subid = id)
        serializer = aucserializers.TicketsSerializer(query, many=True)
        return Response(serializer.data)
        
class ansticket(APIView):
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
            
class closeplanadmin(APIView):
    def post(self, request):
        bidid = request.data['bidid']
        mablagh = request.data['mablagh']
        bids = models.bid.objects.get(id = bidid)
        plans = bids.plan
        wall = models.wallet.objects.get(user = bids.user.id , currency = plans.currency)
        wall.amount = wall.amount + float(mablagh)
        wall.save()
        bids.delete()
            
        return Response()


class adminchangepass(APIView):
    def post(self, request):
        from django.contrib.auth.hashers import PBKDF2PasswordHasher
        passw = request.data["password"]
        repassw = request.data["repassword"]
        user = models.User.objects.get(id=request.data["userid"])
        if passw == repassw:
            passs = make_password(str(passw))
            user.password = passs
            user.save()
            return Response()
        return Response(status=400)
                    
