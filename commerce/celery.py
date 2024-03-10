import os
import datetime
from celery import Celery
from celery.schedules import crontab
# set the default Django settings module for the 'celery' program.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'commerce.settings')


app = Celery()

@app.on_after_configure.connect
def setup_periodic_tasks(sender, **kwargs):

    sender.add_periodic_task(
        crontab(hour=18),
        profit.s(),
    )

@app.task
def profit():
    from auctions.models import User , profitlist,  Transactions , Addamountreq, Plans , bid , like ,Cat , comment , act , currencies ,wallet , Verify , Adminverifymelli , Adminverifybank
    print('hi')
    for user in User.objects.all():
        for bids in bid.objects.filter(userid = user.id):
            print(bids.date_field.strftime("%d"), datetime.datetime.now().strftime("%d"))
            print(Plans.objects.get(id = bids.planid).period)
            if Plans.objects.get(id = bids.planid).period == 'day':
                plan = Plans.objects.get(id = bids.planid)
                wal = wallet.objects.get(user = user.id , curid = plan.cur)
                wal.amount = wal.amount + ((plan.percent*plan.deposit/100)*bids.deposit)
                wal.save()
                pro = profitlist.create(amount = (plan.percent*plan.deposit/100)*bids.deposit , userid = user.id , planid = plan.id)
                pro.save()
                
            elif Plans.objects.get(id = bids.planid).period == 'month':
                if bids.date.strftime("%d") == datetime.datetime.now().strftime("%d") and bids.date + timedelta(hours=12)   < datetime.datetime.now():
                    plan = Plans.objects.get(id = bids.planid)
                    wal = wallet.objects.get(user = user.id , curid = plan.cur)
                    wal.amount = wal.amount + ((plan.percent*plan.deposit/100)*bids.deposit)
                    wal.save()
                    pro = profitlist.create(amount = (plan.percent*plan.deposit/100)*bids.deposit , userid = user.id , planid = plan.id)
                    pro.save()