from django.urls import path

from django.contrib import admin

from django.conf.urls.static import static
from django.conf import settings

from . import views


admin.autodiscover()


urlpatterns = [
    path("user", views.Users.as_view(), name="home"),
    path("user-token/<int:id>", views.UserToken.as_view(), name="home"),
    path("transactions", views.Transaction.as_view(), name="home"),
    path("miners", views.Miners.as_view(), name="home"),
    path("profit", views.Profit.as_view(), name="home"),
    path("add-amount-reqs", views.Addamountreqs.as_view(), name="home"),
    path("ask-amount-reqs", views.Askamountreqs.as_view(), name="home"),
    path("add-amount-reqs/<int:id>", views.Addamountreqs.as_view(), name="home"),
    path("ask-amount-reqs/<int:id>", views.Askamountreqs.as_view(), name="home"),
    path("mellis", views.Mellis.as_view(), name="home"),
    path("mellis/<int:id>", views.Mellis.as_view(), name="home"),
    path("bank", views.Banks.as_view(), name="home"),
    path("bank/<int:id>", views.Banks.as_view(), name="home"),
    path("cur", views.cur.as_view(), name="home"),
    path("cur/<int:id>", views.cur.as_view(), name="home"),
    path("plan", views.plan.as_view(), name="home"),
    path("plan/<int:id>", views.plan.as_view(), name="home"),
    path("miner", views.miner.as_view(), name="home"),
    path("miner/<int:id>", views.miner.as_view(), name="home"),
    path("post", views.post.as_view(), name="home"),
    path("post/<int:id>", views.post.as_view(), name="home"),
    path("product", views.product.as_view(), name="home"),
    path("product/<int:id>", views.product.as_view(), name="home"),
    path("page", views.Pages.as_view(), name="home"),
    path("page/<int:id>", views.Pages.as_view(), name="home"),
    
]
