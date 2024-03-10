from django.urls import path

from django.contrib import admin

from django.conf.urls.static import static
from django.conf import settings

from django.conf.urls import url, include

from . import views


admin.autodiscover()


urlpatterns = [
    path('', views.index, name='home'),
    path("", views.index, name="index"),
    path("login", views.login_view, name="login"),
    path("logout", views.logout_view, name="logout"),
    path("changepass", views.changepass, name="changepass"),
    path("user/adminchangepass", views.adminchangepass, name="adminchangepass"),
    path("register", views.register, name="register"),
    path("addauction", views.addauc, name="addauc"),
    path("addcur", views.addcur, name="addcur"),
    path("listing/<int:id>", views.listing , name="listing"),
    path("<int:id>" , views.listing , name="listin"),
    path("listing/like" , views.liked , name="like"),
    path("like" , views.liked , name="like"),
    path("read/<int:id>" , views.read , name="read"),
    path("aread/<int:id>" , views.aread , name="aread"),
    path("listing/<int:id>/edit", views.edit , name="listing"),
    path("<int:id>/edit", views.edit , name="listin"),
    path("cat" , views.cat , name="cat"),
    path("cat/<str:cat>" , views.categories , name="categories"),
    path("listing/comment" , views.comments , name = "comment"),
    path("comment" , views.comments , name = "comment"),
    path("message" , views.message , name = "message"),
    path('usercpanel' , views.cpanel , name = 'cpanel'),
    path('plans' , views.plans , name = 'plans'),
    path('adminpanel' , views.adminpanel , name = 'adminpanel'),
    path('listing/buy' , views.buy , name = 'buy'),
    path('buy' , views.buy , name = 'buy'),
    path('verifyemail' , views.verifyemail , name = 'verifyemail'),
    path('verifymobile' , views.verifymobile , name = 'verifymobile'),
    path('verifymelli' , views.verifymelli , name = 'verifymelli'),
    path('verifybank' , views.verifybank , name = 'verifybank'),
    path('verifymellicheck' , views.verifymellicheck , name = 'verifymellicheck'),
    path('verifybankcheck' , views.verifybankcheck , name = 'verifybankcheck'),
    path('deletecur' , views.deletecur , name = 'deletecur'),
    path('editcur' , views.editcur , name = 'editcur'),
    path('addamountreq' , views.addamountreq , name = 'addamountreq'),
    path('askamountreq' , views.askamountreq , name = 'askamountreq'),
    path('amountreqcheck' , views.amountreqcheck , name = 'amountreqcheck'),
    path('askamountreqcheck' , views.askamountreqcheck , name = 'askamountreqcheck'),
    path('closeplan' , views.closeplan , name = 'closeplan'),
    path('user/closeplanadmin' , views.closeplanadmin , name = 'closeplanadmin'),
    path('blog' , views.blog , name = 'blog'),
    path('addpost' , views.addpost , name = 'addpost'),
    path('addticket' , views.addticket , name = 'addticket'),
    path('addjob' , views.addjob , name = 'addjob'),
    path('ansticket' , views.ansticket , name = 'ansticket'),
    path('user/faddticket' , views.faddticket , name = 'faddticket'),
    path('fallticket' , views.fallticket , name = 'fallticket'),
    path('aansticket' , views.aansticket , name = 'aansticket'),
    path('closeticket' , views.aansticket , name = 'aansticket'),
    path('blog' , views.blog , name = 'blog'),
    path('contact' , views.contact , name = 'contact'),
    path('about' , views.about , name = 'about'),
    path('setting' , views.setting , name = 'setting'),
    path('page/<int:id>/edit' , views.pageedit , name = 'pageedit'),
    path('page/<int:id>' , views.page , name = 'page'),
    path('post/<int:id>/edit' , views.postedit , name = 'postedit'),
    path('post/<int:id>/delete' , views.postdelete , name = 'postdelete'),
    path('registerinv/<str:refe>' , views.registerinv , name = 'registerinv'),
    path('user/<int:id>' , views.user , name = 'user'),
    path('user/<int:id>/delete' , views.userdelete , name = 'userdelete'),
    path('user/<int:id>/block' , views.userblock , name = 'userblock'),
    path('user/<int:id>/unblock' , views.userunblock , name = 'userunblock'),
    path('user/adminincrease' , views.adminincrease , name = 'adminincrease'),
    path('user/admindecrease' , views.admindecrease , name = 'admindecrease'),
    path('user/adminverify' , views.adminverify , name = 'adminverify'),
    path('forgetreq' , views.forgetreq , name = 'forgetreq'),
    path('resetpass/<str:key>' , views.resetpass , name = 'resetpass'),
    path('resetpass' , views.resetpass , name = 'resetpass'),
]+ static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)