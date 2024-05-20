from django.contrib import admin

from .models import Job , pages, bazdid , Subjects ,Tickets, profitlist , settings ,  post ,  bid, Transactions, Addamountreq, Askamountreq , currencies ,  User , Plans , Cat  , wallet ,Verify , Adminverifymelli , Adminverifybank, General, Miners, RentedMiner, News, Banner, Elan, Product, ProductOrder
# Register your models here.

class UserAdmin(admin.ModelAdmin):
    search_fields = ['username']

class FooAdmin(admin.ModelAdmin):
    readonly_fields = ('start_date',)




admin.site.register(User, UserAdmin)
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
admin.site.register(Miners)
admin.site.register(RentedMiner, FooAdmin)
admin.site.register(News)
admin.site.register(Banner)
admin.site.register(Elan)
admin.site.register(Product)
admin.site.register(ProductOrder)