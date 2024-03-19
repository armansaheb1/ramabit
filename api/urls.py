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
    path("user", views.Users.as_view(), name="home"),
    path("settings", views.Settings.as_view(), name="home"),
    path("pages/<int:id>", views.Pages.as_view(), name="home"),
    path("plan-by-currency/<int:id>", views.PlansByCurrencies.as_view(), name="home"),
    path("wallets", views.Wallets.as_view(), name="home"),
]
