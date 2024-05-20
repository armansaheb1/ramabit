from rest_framework import serializers
from auctions import models
from django.contrib.auth import get_user_model

User = get_user_model()


class TransactionsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Transactions
        depth = 1
        fields = "__all__"

class profitlistSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.profitlist
        depth = 1
        fields = "__all__"

class AskamountreqSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Askamountreq
        depth = 1
        fields = "__all__"

class AddamountreqSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Addamountreq
        depth = 1
        fields = "__all__"

class AdminverifymelliSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Adminverifymelli
        depth = 1
        fields = (
            "id",
            "user", 
    "melliimg",
    "mellic",
    "action",
    "get_image"
        )


class AdminverifybankSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Adminverifybank
        depth = 1
        fields = fields = (
            "id",
            "user", 
    "bankimg",
    "bankc",
    "action",
    "get_image"
        )

class GeneralSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.General
        fields = "__all__"


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"




class SettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.settings
        fields = "__all__"


class PagesSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.pages
        fields = '__all__'

class RentedMinerSerializer(serializers.ModelSerializer):
    class Meta:
        depth = 2
        model = models.RentedMiner
        fields = (
            "id",
            "paid",
            "user",
            "miner",
            "start_date",
            "last_check",
            "get_image",
            "done"
        )

class BidSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.bid
        depth = 2
        fields = (
            "id",
            "plan", 
            "user",
            "deposit",
            "option",
            "date_field",
            "get_image"
        )


class CurrencySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.currencies
        fields = (
            "id",
            "name",
            "brand",
            "pic",
            "qr",
            "address",
            "get_image",
            "get_qr",
        )


class CurrencyImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.currencies
        fields = ["get_image"]


class PlansSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Plans
        fields = (
            "id",
            "title", 
    "currency",
    "des",
    "percent",
    "mini",
    "maxi",
    "period",
"get_cur"
        )

class MinersSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Miners
        depth = 1
        fields = (
        "id",
        "title",
        "pic",
        "currency",
        "des",
        "rate",
        "period",
        "get_pic",
        "get_cur_pic",
        "price",
        "profit",
        "get_cur"
        )


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.post
        fields = (
            "id",
            "date", 
    "title",
    "text",
    "pic",
    "place",
    "get_image",
    "app",
    "index"
        )


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Product
        fields = (
            "id",
            "title",
            "des",
            "get_image",
        )

        
class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.News
        fields = (
            "id",
            "date", 
    "title",
    "text",
    "pic",
    "place",
    "get_image"
        )


class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Banner
        fields = (
            "id",
    "title",
    "get_image"
        )
