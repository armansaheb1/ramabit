import os
import sys
import time
from django.utils import timezone
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project_name.settings")
from ippanel import Client
from django.core.management.base import BaseCommand
from django.core.mail import send_mail
from auctions.models import User , profitlist,  Transactions , Addamountreq, Plans , bid  , act , currencies ,wallet , Verify , Adminverifymelli , Adminverifybank
from datetime import timedelta , datetime

print('hi')
send_mail(
            ' سود',
            'سوددهی آخر',
            'info@ramabit.com',
            ['armansaheb@gmail.com'],
            fail_silently=False,
        )
class Command(BaseCommand):
    def handle(self, *args, **options):
        for user in User.objects.all():
            user.username = user.username.lower()
            user.save()
