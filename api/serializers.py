from rest_framework import serializers
from auctions import models
from django.contrib.auth import get_user_model

User = get_user_model()


class GeneralSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.General
        fields = "__all__"


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.post
        fields = "__all__"


class SettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.settings
        fields = "__all__"


class PagesSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.pages
        fields = "__all__"


class CurrencySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.currencies
        fields = (
            "name",
            "brand",
            "pic",
            "qr",
            "address",
            "get_image",
            "get_qr",
        )
        extra_fields = ["get_image"]


class CurrencyImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.currencies
        fields = ["get_image"]


class PlansSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Plans
        fields = "__all__"
