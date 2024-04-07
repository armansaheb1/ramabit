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
        query = models.Plans.objects.filter(cur=query.id)
        serializer = serializers.PlansSerializer(query, many=True)
        return Response(serializer.data)


class MinersByCurrencies(APIView):
    def get(self, request, id):
        query = models.currencies.objects.get(id=id)
        query = models.Miners.objects.filter(id=id)
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)
    
class MinersPic(APIView):
    def get(self, request, brand):
        query = models.Miners.objects.filter(cur = models.currencies.objects.get(brand = brand))
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)


class Miners(APIView):
    def get(self, request, brand):
        query = models.Miners.objects.filter(cur = models.currencies.objects.get(brand = brand))
        serializer = serializers.MinersSerializer(query, many=True)
        return Response(serializer.data)


class MinersCurrencies(APIView):
    def get(self, request):
        mylist = []
        query = models.Miners.objects.all()
        for item in query:
            if not item.cur.brand in mylist:
                mylist.append(item.cur.brand)
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
            if(len(models.wallet.objects.filter(use = request.user , curid= cur.pk))>0):
                wal = models.wallet.objects.get(use = request.user , curid= cur.pk)
                wa.append([cur.get_image() , wal.amount , cur.brand, cur.pk, cur.name, cur.price])
            else:
                wa.append([cur.get_image() , 0 , cur.brand , cur.pk, cur.name, cur.price] )
        return Response(wa)

    def post(self, request, id):
        wa = []
        for cur in models.currencies.objects.filter(id = id):
            if(len(models.wallet.objects.filter(use = request.user , curid= cur.pk))>0):
                wal = models.wallet.objects.get(use = request.user , curid= cur.pk)
                wa.append([cur.get_image() , wal.amount , cur.brand, cur.pk])
            else:
                wa.append([cur.get_image() , 0 , cur.brand , cur.pk] )
        return Response(wa)

class Profits(APIView):

    def get(self, request):
        pro = []
    
        for eplan in models.profitlist.objects.filter(use = request.user):
            if(models.Plans.objects.filter(id = eplan.planid )):
                plant = models.Plans.objects.get(id = eplan.planid ).title
                cur = models.currencies.objects.get(id = models.Plans.objects.get(id = eplan.planid ).cur).pic 
            else:
                if len(User.objects.filter(id = eplan.invid )) > 0:
                    plant = " سود حاصل از زیرمجموعه : "  + User.objects.get(id = eplan.invid ).name + ' ' + User.objects.get(id = eplan.invid ).lastname 
                else :
                    plant = " سود حاصل از زیرمجموعه : "  + 'کاربر وجود ندارد'
                cur = models.currencies.objects.get(id = eplan.curid).pic 
            pro.append([User.objects.get(id = eplan.userid).name + User.objects.get(id = eplan.userid).lastname , plant ,eplan.amount,eplan.date,cur])

        return Response(pro)




class Transaction(APIView):
    
    def get(self, request):
        trans = []
        transaction = models.Transactions.objects.filter(use = request.user)
        for transa in transaction:
            if transa.act == 0 :
                act = 'برداشت'
                act = 'red'
            else:
                act = 'واریز'
                actc= 'green'
            trans.append([models.currencies.objects.get(id = transa.curid).pic, transa.amount,transa.date,act,actc])
        return Response(trans)
    

class Special(APIView):
    def get(self, request):
        query = models.post.objects.filter(place = 'home'),
        serializer = serializers.PostSerializer(query, many=True)
        return Response(serializer.data)