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
class Command(BaseCommand):
    def handle(self, *args, **options):
        for anyplan in bid.objects.all():
            if int(anyplan.date_field.strftime("%d")) == 30 or int(anyplan.date_field.strftime("%d")) == 31 :
                anyplan.date_field = anyplan.date_field - timedelta(days=2)
                anyplan.save()
        for user in User.objects.all():
            for bids in bid.objects.filter(userid = user.id):
                print(bids.date_field.strftime("%d"), timezone.now().strftime("%d"))
                print(Plans.objects.get(id = bids.planid).period)
                print(bids.date_field.strftime("%d") == timezone.now().strftime("%d") and bids.date_field + timedelta(days=1)   < datetime.date(timezone.now()))
                if Plans.objects.get(id = bids.planid).period == 'day':
                    pass
                elif Plans.objects.get(id = bids.planid).period == 'month':
                    if bids.date_field.strftime("%d") == timezone.now().strftime("%d") and bids.date_field + timedelta(days=1)   < datetime.date(timezone.now()):
                        plan = Plans.objects.get(id = bids.planid)
                        if bids.option == 'wal':
                            wal = wallet.objects.get(user = user.id , curid = plan.cur)
                            wal.amount = wal.amount + ((plan.percent*bids.deposit/100))
                            wal.save()
                            pro = profitlist(amount = (plan.percent*bids.deposit/100) , userid = user.id , planid = plan.id)
                            pro.save()
                        if bids.option == 'add':
                            bids.deposit = bids.deposit + ((plan.percent*bids.deposit/100))
                            bids.save()
                            pro = profitlist(amount = (plan.percent*bids.deposit/100) , userid = user.id , planid = plan.id)
                            pro.save()
                elif Plans.objects.get(id = bids.planid).period == 'half-year':
                    if bids.date_field.strftime("%d") == timezone.now().strftime("%d") and bids.date_field + timedelta(days=1)   < datetime.date(timezone.now()):
                        plan = Plans.objects.get(id = bids.planid)
                        if bids.option == 'wal':
                            wal = wallet.objects.get(user = user.id , curid = plan.cur)
                            wal.amount = wal.amount + ((plan.percent*bids.deposit/100))
                            wal.save()
                            pro = profitlist(amount = (plan.percent*bids.deposit/100) , userid = user.id , planid = plan.id)
                            pro.save()
                        if bids.option == 'add':
                            bids.deposit = bids.deposit + ((plan.percent*bids.deposit/100))
                            bids.save()
                            pro = profitlist(amount = (plan.percent*bids.deposit/100) , userid = user.id , planid = plan.id)
                            pro.save()
                elif Plans.objects.get(id = bids.planid).period == 'year':
                    if bids.date_field.strftime("%d") == timezone.now().strftime("%d") and bids.date_field + timedelta(days=1)   < datetime.date(timezone.now()):
                        plan = Plans.objects.get(id = bids.planid)
                        if bids.option == 'wal':
                            wal = wallet.objects.get(user = user.id , curid = plan.cur)
                            wal.amount = wal.amount + ((plan.percent*bids.deposit/100))
                            wal.save()
                            pro = profitlist(amount = (plan.percent*bids.deposit/100) , userid = user.id , planid = plan.id)
                            pro.save()
                        if bids.option == 'add':
                            bids.deposit = bids.deposit + ((plan.percent*bids.deposit/100))
                            bids.save()
                            pro = profitlist(amount = (plan.percent*bids.deposit/100) , userid = user.id , planid = plan.id)
                            pro.save()
                            print('done')
