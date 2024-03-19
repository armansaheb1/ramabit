from django.contrib import admin

from .models import Job , pages, bazdid , Subjects ,Tickets, profitlist , settings ,  post ,  bid, Transactions, Addamountreq, Askamountreq , currencies ,  User , Plans , Cat  , wallet ,Verify , Adminverifymelli , Adminverifybank, General
# Register your models here.
admin.site.register(User)
admin.site.register(Plans)
admin.site.register(wallet)
admin.site.register(Verify)
admin.site.register(Adminverifymelli)
admin.site.register(Adminverifybank)
admin.site.register(currencies)
admin.site.register(Addamountreq)
admin.site.register(Askamountreq)
admin.site.register(Transactions)
admin.site.register(bid)
admin.site.register(post)
admin.site.register(settings)
admin.site.register(profitlist)
admin.site.register(Subjects)
admin.site.register(Tickets)
admin.site.register(bazdid)
admin.site.register(pages)
admin.site.register(Job)
admin.site.register(General)