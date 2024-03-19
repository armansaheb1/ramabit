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


class PlansByCurrencies(APIView):
    def get(self, request, id):
        query = models.currencies.objects.get(id=id)
        query = models.Plans.objects.filter(cur=query.id)
        serializer = serializers.PlansSerializer(query, many=True)
        return Response(serializer.data)


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
            if(len(models.wallet.objects.filter(user = request.user.id , curid= cur.pk))>0):
                wal = models.wallet.objects.get(user = request.user.id , curid= cur.pk)
                wa.append([cur.get_image() , wal.amount , cur.brand, cur.pk])
            else:
                wa.append([cur.get_image() , 0 , cur.brand , cur.pk] )
        print(wa)
        return Response(wa)
