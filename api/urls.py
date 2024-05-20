from django.urls import path

from django.contrib import admin

from django.conf.urls.static import static
from django.conf import settings

from . import views


admin.autodiscover()


urlpatterns = [
    path("general", views.Generals.as_view(), name="home"),
    path("posts", views.Posts.as_view(), name="home"),
    path("currencies", views.Currencies.as_view(), name="home"),
    path("currencies/<id>", views.CurrenciesPic.as_view(), name="home"),
    path("miners", views.MinersPic.as_view(), name="home"),
    path("miners/<brand>", views.MinersPic.as_view(), name="home"),
    path("user", views.Users.as_view(), name="home"),
    path("settings", views.Settings.as_view(), name="home"),
    path("pages/<brand>", views.Pages.as_view(), name="home"),
    path("plan-by-currency/<int:id>", views.PlansByCurrencies.as_view(), name="home"),
    path("plans-index/<period>", views.PlansIndex.as_view(), name="home"),
    path("plans-index", views.PlansIndex.as_view(), name="home"),
    path("miner-by-currency/<int:id>", views.MinersByCurrencies.as_view(), name="home"),
    path("minerscurrencies", views.MinersCurrencies.as_view(), name="home"),
    path("wallets", views.Wallets.as_view(), name="home"),
    path("wallets/<id>", views.Wallets.as_view(), name="home"),
    path("profits", views.Profits.as_view(), name="home"),
    path("transactions", views.Transaction.as_view(), name="home"),
    path("changepass", views.ChangePass.as_view(), name="home"),
    path("special", views.Special.as_view(), name="home"),
    path("addamountreq", views.AddAmountReq.as_view(), name="home"),
    path("askamountreq", views.AskAmountReq.as_view(), name="home"),
    path("buyplan", views.BuyPlan.as_view(), name="home"),
    path("plan", views.Plan.as_view(), name="home"),
    path("closeplan", views.closeplan.as_view(), name="home"),
    path("rentminer", views.RentMiner.as_view(), name="home"),
    path("miner", views.Miner.as_view(), name="home"),
    path("news", views.Newses.as_view(), name="home"),
    path("verifymobile", views.VerifyMobile.as_view(), name="home"),
    path("banner", views.Banners.as_view(), name="home"),
    path("elan", views.Elans.as_view(), name="home"),
]
