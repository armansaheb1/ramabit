import os
import sys
import time
from django.utils import timezone
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project_name.settings")
from ippanel import Client
from django.core.management.base import BaseCommand
from django.core.mail import send_mail
from auctions.models import Job, User , profitlist,  Transactions , Addamountreq, Plans , bid  , act , currencies ,wallet , Verify , Adminverifymelli , Adminverifybank, Miners, Askamountreq, Subjects
from datetime import timedelta , datetime
import requests


class Command(BaseCommand):
    def handle(self, *args, **options):
        url = "https://rest.coinapi.io/v1/assets?filter_exchange_id=BINANCE"

        payload={}
        headers = {
        'Accept': 'text/plain',
        'X-CoinAPI-Key': '71FAEACB-FF5B-40B0-84F9-26E64E9DED20'
        }

        response = requests.request("GET", url, headers=headers, data=payload)

        for item in response.json():
            if 'asset_id' in item:
                query = currencies.objects.filter(brand = item['asset_id'])
                if len(query):
                    for itemm in query:
                        print(item['asset_id'])
                        itemm.price = item['price_usd']
                        itemm.save()