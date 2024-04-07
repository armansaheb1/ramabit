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
        for item in Job.objects.all():
            if len(User.objects.filter(id = item.userid)):
                item.use = User.objects.get(id = item.userid)
                item.save()
            else:
                item.delete()