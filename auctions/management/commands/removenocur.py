import os
import sys
import time
from django.utils import timezone
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project_name.settings")
from ippanel import Client
from django.core.management.base import BaseCommand
from django.core.mail import send_mail
from auctions.models import Job, User , profitlist,  Transaction , Addamountreq, Plans , bid  , act , currencies ,wallet , Verify , Adminverifymelli , Adminverifybank, Miners, Askamountreq, Subjects
from datetime import timedelta , datetime


class Command(BaseCommand):
    def handle(self, *args, **options):
        i = 90
        for item in Transactions.objects.all():
            Transaction.objects.create(date = item.date,
            amount = item.amount,
            user = item.user,
            currency = item.currency,
            act = item.act)
