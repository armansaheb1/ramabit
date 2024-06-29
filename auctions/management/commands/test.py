import os
import sys
import time
from django.utils import timezone
from auctions import models
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project_name.settings")
from django.core.management.base import BaseCommand

class Command(BaseCommand):
    def handle(self, *args, **options):
        for item in models.currencies.objects.all():
            print(item.align)
            if item.align == None:
                
                for itemm in range(100):
                    try:
                        item.align = itemm
                        item.save()
                    except:
                        pass