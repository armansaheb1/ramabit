import os
import sys
import time
from django.utils import timezone
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project_name.settings")
from ippanel import Client
from django.core.management.base import BaseCommand
from django.core.mail import send_mail
from auctions.models import Job, User , profitlist,  Transactions , Addamountreq, Plans , bid  , act , currencies ,wallet , Verify , Adminverifymelli , Adminverifybank, Miners, Askamountreq, Subjects, RentedMiner
from datetime import timedelta , datetime


class Command(BaseCommand):
    def handle(self, *args, **options):
        for item in RentedMiner.objects.filter(done = False):
            wall, _ = wallet.objects.get_or_create(user = item.user, currency = item.miner.currency)
            amount = item.miner.profit / (int(item.miner.period) * 288 * 5)
            if not item.miner.profit <= item.paid + amount:
                wall.amount = wall.amount +(amount)
                wall.save()
                item.paid = item.paid + (amount)
                item.save()
            else:
                amount = item.miner.profit - item.paid
                wall.amount = wall.amount +(amount)
                wall.save()
                item.paid = item.paid + (amount)
                item.done= True
                item.save()