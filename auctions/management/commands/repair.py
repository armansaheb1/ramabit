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


class Command(BaseCommand):
    def handle(self, *args, **options):
        
        for item in profitlist.objects.all():

            '''
            if len(currencies.objects.filter(pk = item.curid)):
                print(item)
                item.currency = currencies.objects.get(pk = item.curid)
                item.save()
            '''

            if len(Plans.objects.filter(pk = item.planid)):
                print('hi')
                item.plan = Plans.objects.get(pk = item.planid)
                item.save()
