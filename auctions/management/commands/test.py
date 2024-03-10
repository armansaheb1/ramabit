import os
import sys
import time
from django.utils import timezone
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project_name.settings")

while True:
    from auctions.models import User , profitlist,  Transactions , Addamountreq, Plans , bid , like ,Cat , comment , act , currencies ,wallet , Verify , Adminverifymelli , Adminverifybank
    print('hi')
    for user in User.objects.all():
        for bids in bid.objects.filter(userid = user.id):
            print(bids.date_field.strftime("%d"), timezone.now().strftime("%d"))
            print(Plans.objects.get(id = bids.planid).period)
            plan = Plans.objects.get(id = bids.planid)
            wal = wallet.objects.get(user = user.id , curid = plan.cur)
            wal.amount = wal.amount + ((plan.percent*bids.deposit/100))
            wal.save()
            pro = profitlist(amount = (plan.percent*bids.deposit/100) , userid = user.id , planid = plan.id)
            pro.save()
    time.sleep(10)