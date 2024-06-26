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
    path("miners/<str:brand>", views.MinersPic.as_view(), name="home"),
    path("miners-date", views.MinersPic.as_view(), name="home"),
    path("miners-date/<period>", views.MinersPic.as_view(), name="home"),
    path("onemine/<id>", views.MinersPic.as_view(), name="home"),
    path("user", views.Users.as_view(), name="home"),
    path("settings", views.Settings.as_view(), name="home"),
    path("pages/<brand>", views.Pages.as_view(), name="home"),
    path("details/<id>", views.Detail.as_view(), name="home"),
    path("plan-by-currency/<int:id>", views.PlansByCurrencies.as_view(), name="home"),
    path("plans-index/<str:period>", views.PlansIndex.as_view(), name="home"),
    path("plans-index", views.PlansIndex.as_view(), name="home"),
    path("oneplan/<int:id>", views.OnePlan.as_view(), name="home"),
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
    path("rentminers", views.RentMiners.as_view(), name="home"),
    path("miner", views.Miner.as_view(), name="home"),
    path("news", views.Newses.as_view(), name="home"),
    path("verifymobile", views.VerifyMobile.as_view(), name="home"),
    path("banner", views.Banners.as_view(), name="home"),
    path("elan", views.Elans.as_view(), name="home"),
    path("subjects", views.Subjects.as_view(), name="home"),
    path("tickets/<id>", views.tickets.as_view(), name="home"),
    path("vorood", views.vorood.as_view(), name="home"),
    path("addticket", views.addticket.as_view(), name="home"),
    path("ansticket", views.ansticket.as_view(), name="home"),
    path("forgetreq", views.forgetreq.as_view(), name="home"),
    path("resetpass", views.resetpass.as_view(), name="home"),
    path("notifications", views.Notifications.as_view(), name="home"),
    path("inv", views.Inv.as_view(), name="home"),
    path("app-setting", views.AppSetting.as_view(), name="home"),
]
