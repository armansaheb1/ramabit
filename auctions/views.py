from django.contrib.auth import authenticate, login, logout
from django.db import IntegrityError
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render , redirect
from django.urls import reverse
from .models import Forget, Job, pages , bazdid , Tickets,Subjects, Askamountreq, profitlist , settings , post , User ,  Transactions , Addamountreq, Plans , bid  ,Cat  , act , currencies ,wallet , Verify , Adminverifymelli , Adminverifybank
from django.core.mail import send_mail
from django.contrib.auth.models import User
import json
import time
import os
import logging
from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import user_passes_test
from random import randrange
from django.http import JsonResponse
from django.utils import timezone
from django.core import management
from datetime import timedelta
from ippanel import Client
from django.contrib.auth.hashers import make_password

    

def index(request):
    if(len(request.user.username)>0):
      pass  
    else:
        bazd = bazdid(count = 1)
        bazd.save()

    return render(request, "auctions/index.html" , {
        "auc" : Plans.objects.all(),
        "max" : bid,
        "banner" : post.objects.filter(place = 'banner'),
        "home" : post.objects.filter(place = 'home'),
        'special': post.objects.filter(place = 'special'),
        'set' : settings.objects.get(id=1),
        
    })
def plans(request):
    plans = []
    for item1 in currencies.objects.all():
        plans.append([Plans.objects.filter(cur = item1.id) , item1.name , item1.pic])
    return render(request, "auctions/plans.html" , {
        "plans" : plans,
        'set' : settings.objects.get(id=1)
    })


def login_view(request):
    if request.method == "POST":
        # Attempt to sign user in
        username = request.POST["username"].lower()
        password = request.POST["password"]
        if('@' in username):
            if len(User.objects.filter(email=username)) < 1:
                return render(request, "auctions/login.html", {
                "message": "ایمیل وارد شده اشتباه است",
                'set' : settings.objects.get(id=1)
            })
            username = User.objects.get(email=username).username
        user = authenticate(request, username=username, password=password)

        
        
        # Check if authentication successful
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("cpanel"))
        else:
            return render(request, "auctions/login.html", {
                "message": "Invalid username and/or password..",
                'set' : settings.objects.get(id=1)

            })
    else:
        return render(request, "auctions/login.html",{
            'set' : settings.objects.get(id=1)
        })


def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse("index") ,{
                'set' : settings.objects.get(id=1)
    })


def register(request):
    if request.method == "POST":
        username = request.POST["username"].lower()
        email = request.POST["email"].lower()

        # Ensure password matches confirmation
        password = request.POST["password"]
        confirmation = request.POST["confirmation"]
        name = request.POST['name']
        lastname = request.POST['lastname']
        mobile = request.POST['tel']
        refe = request.POST['ref']
        if len(User.objects.filter(email=email))>0:
            return render(request, "auctions/register.html", {
                "message": "  ایمیل وارد شده تکراریست",
                'set' : settings.objects.get(id=1),
                'ref': refe
            })
        if len(request.POST['ref']) > 2:
            if len(User.objects.filter(ref=refe))<1:
                return render(request, "auctions/register.html", {
                    "message": "  کد دعوت وارد شده اشتباه است",
                    'set' : settings.objects.get(id=1),
                    'ref': refe
                })
        if password != confirmation:
            return render(request, "auctions/register.html", {
                "message": "Passwords must match.",
                'set' : settings.objects.get(id=1),
                'ref': refe
            })
        # Attempt to create new user
        try:
            if not refe :
                ref = 0
            user = User.objects.create_user(username, email, password=password ,name=name ,lastname=lastname ,mobile=mobile , inv = refe)
            user.save()
            ver = Verify(userid=user.id)
            ver.save()
        except IntegrityError:
            return render(request, "auctions/register.html", {
                "message": "Username already taken.",
                        'set' : settings.objects.get(id=1),

            })
        login(request, user)
        return HttpResponseRedirect(reverse("cpanel") , {
                    'set' : settings.objects.get(id=1)
        })
    else:
        return render(request, "auctions/register.html" , {
                    'set' : settings.objects.get(id=1),
        })
        

def registerinv(request , refe ):
    return render(request, "auctions/register.html" , {
                'set' : settings.objects.get(id=1),
                'ref' : refe
    })

def addauc(request):
    if(request.method == 'POST'):
        title = request.POST['title']
        cur = request.POST['cur']
        des = request.POST['des']
        percent = request.POST['percentm']
        iden = request.POST['iden']
        period = request.POST['period']
        auc = Plans(title = title , des = des , user = iden , percent = percent , period = period , cur=currencies.objects.get(name = cur).id)
        auc.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "Added Successfully",
            'set' : settings.objects.get(id=1)

        })
        
    else:
        return render(request , "auctions/addauc.html" , {
            'auc' : Plans.objects.all(),
            'set' : settings.objects.get(id=1),
            'cur' : currencies.objects.all()
        })

def addcur(request):
    if(request.method == 'POST'):
        name = request.POST['name']
        brand = request.POST['brand']
        pic = request.FILES['pic']
        qr = request.FILES['qr']
        address = request.POST['address']
        auc = currencies(name = name , pic = pic , qr = qr , address = address,brand = brand)
        auc.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "Added Successfully",
            'set' : settings.objects.get(id=1)
        })
        
    else:
        return render(request , "auctions/addauc.html" , {
            'auc' : Plans.objects.all(),
            'cur' : currencies.objects.all(),
            'set' : settings.objects.get(id=1)
        })

def editcur(request):
    if(request.method == 'POST'):
        iden = request.POST['id']
        name = request.POST['name']
        brand = request.POST['brand']
        address = request.POST['address']
        cur = currencies.objects.get(id = iden)
        cur.name = name
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            cur.pic = pic
        cur.brand = brand
        if 'qr' in request.FILES:
            qr = request.FILES['qr']
            cur.qr = qr
        cur.address = address
        cur.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "Added Successfully",
            'set' : settings.objects.get(id=1)
        })
        
    else:
        return render(request , "auctions/addauc.html" , {
            'auc' : Plans.objects.all(),
            'cur' : currencies.objects.all(),
            'set' : settings.objects.get(id=1)
        })

def listing(request, id):
    if(request.method == "POST") :
        listing = Plans.objects.get(id = id)
        bids = request.POST["bid"]
        userid = request.POST["userid"]
        planid = request.POST["aucid"]
        option = request.POST["option"]
        b = bid(deposit= bids , userid = userid , planid = planid , option = option)
        b.save()
        c = Plans(id = id ,title = listing.title , des = listing.des , percent = listing.percent , pic = listing.pic , cat = listing.cat , user = listing.user , cp = bids)
        c.save()
        return render(request, "auctions/cpanelmsg.html" , {
            "m": "پلن شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })
    else:
        listing = Plans.objects.get(id = id)
        pic = currencies.objects.get(id = listing.cur).pic
        return render(request , "auctions/listing.html", {
            "list" : listing ,
            'pic': pic,
            'set' : settings.objects.get(id=1)
        })

def liked(request):
    aucid = request.POST["aucid"]
    if request.POST["el"] == "like":
        alike = like(userid = request.user.id , likeid = aucid)
        alike.save()
    else :
        like.objects.filter(userid = request.user.id , likeid = aucid).delete()
    return redirect(f"/{aucid}")
    
def edit(request , id):
    if(request.method == 'POST'):
        title = request.POST['title']
        des = request.POST['des']
        percent = request.POST['percent']
        auc = Plans.objects.get(id = id)
        auc.title = title 
        auc.des = des 
        auc.percent = percent 
        auc.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "Edited Successfully",
            'set' : settings.objects.get(id=1)
        })
    else:
        auc = Plans.objects.get(id = id)
        return render(request , "auctions/edit.html" , {
            'auc' : auc,
            'set' : settings.objects.get(id=1)
        })

def cat(request):
    return render(request , "auctions/cat.html",{
        'auc' : Cat.objects.all(),
        'set' : settings.objects.get(id=1)
    })

def categories(request , cat):
    return render(request , "auctions/categories.html",{
        'auc' : Plans.objects.filter(cat = cat),
        'set' : settings.objects.get(id=1)
    })

def comments(request):
    username = request.POST["username"]
    userid = request.POST["userid"]
    aucid = request.POST["aucid"]
    title = request.POST["title"]
    text = request.POST["text"]
    com = comment(userid = userid , aucid = aucid , title = title , text = text , username = username)
    com.save() 
    return redirect(f"/{aucid}" , {
        'set' : settings.objects.get(id=1)
    })

def message(request):
    return render(request , "auctions/message.html" , {
        'set' : settings.objects.get(id=1)
    })

@user_passes_test(lambda user: user.is_active , login_url='login')
def cpanel(request):
    if(len(Verify.objects.filter(userid = request.user.id))<1):
        verify = Verify(userid = request.user.id)
        verify.save()
    user = Verify.objects.get(userid=request.user.id)
    n = '#FF0000'
    s = '#00ff00'
    wa = []
    trans = []
    bids = []
    subject = []

    wall = wallet.objects.filter(user = request.user.id)
    bi = bid.objects.filter(userid = request.user.id)
    for bii in bi :
        
        bids.append([currencies.objects.get(id = Plans.objects.get(id = bii.planid).cur).pic , bii.deposit ,bii.date_field, Plans.objects.get(id = bii.planid).period ,Plans.objects.get(id = bii.planid).percent , bii.id])
    
    for cur in currencies.objects.all():
        if(len(wallet.objects.filter(user = request.user.id , curid= cur.id))>0):
            wal = wallet.objects.get(user = request.user.id , curid= cur.id)
            wa.append([cur.get_image() , wal.amount , cur.brand,cur.id])
        else:
            wa.append([cur.get_image() , 0 , cur.brand , cur.id] )
            
            
    transaction = Transactions.objects.filter(userid = request.user.id)
    for transa in transaction:
        if transa.act == 0 :
            act = 'برداشت'
            act = 'red'
        else:
            act = 'واریز'
            actc= 'green'
        trans.append([currencies.objects.get(id = transa.curid).pic, transa.amount,transa.date,act,actc])
    if user.mobilev == True : 
        mobilev = 'تایید شده' 
        mobilevc = s
    else: 
        mobilev = 'تایید نشده'
        mobilevc = n
    if user.emailv == True : 
        emailv = 'تایید شده' 
        emailvc = s
    else:
        emailv = 'تایید نشده'
        emailvc = n
    if user.mobilev == True : 
        idv = 'تایید شده' 
        idvc = s
    else: 
        idv = 'تایید نشده'
        idvc = n
    if user.mobilev == True : 
        bankv = 'تایید شده' 
        bankvc = s
    else: 
        bankv = 'تایید نشده'
        bankvc = n
    if user.melliv == 0 : 
        melliv = 'تایید نشده'
        mellivc = n
    elif user.melliv == 1 : 
        melliv = 'در انتظار تایید '
        mellivc = n
    elif user.melliv == 2 : 
        melliv = 'رد شده '
        mellivc = n
    elif user.melliv == 3 : 
        melliv = 'تایید شده '
        mellivc = s
    if user.bankv == 0 : 
        bankv = 'تایید نشده'
        bankvc = n
    elif user.bankv == 1 : 
        bankv = 'در انتظار تایید '
        bankvc = n
    elif user.bankv == 2 : 
        bankv = 'رد شده '
        bankvc = n
    elif user.bankv == 3 : 
        bankv = 'تایید شده '
        bankvc = s

    pro = []
    
    for eplan in profitlist.objects.filter(userid = request.user.id):
        if(Plans.objects.filter(id = eplan.planid )):
            plant = Plans.objects.get(id = eplan.planid ).title
            cur = currencies.objects.get(id = Plans.objects.get(id = eplan.planid ).cur).pic 
        else:
            if len(User.objects.filter(id = eplan.invid )) > 0:
                plant = " سود حاصل از زیرمجموعه : "  + User.objects.get(id = eplan.invid ).name + ' ' + User.objects.get(id = eplan.invid ).lastname 
            else :
                plant = " سود حاصل از زیرمجموعه : "  + 'کاربر وجود ندارد'
            cur = currencies.objects.get(id = eplan.curid).pic 
        pro.append([User.objects.get(id = eplan.userid).name + User.objects.get(id = eplan.userid).lastname , plant ,eplan.amount,eplan.date,cur])
    inv = ''
    
    if(User.objects.filter(ref = request.user.inv).exists()):
        inv = User.objects.get(ref = request.user.inv).lastname + User.objects.get(ref = request.user.inv).name
    d1 = []
    d2 = []
    d3 = []
    d4 = []
    for item in User.objects.filter(inv=request.user.ref):
        d1.append(item.lastname +'   '+ item.name)
        for itemm in User.objects.filter(inv=item.ref):
            d2.append(itemm.name + ' ' + itemm.lastname)
            for itemmm in User.objects.filter(inv=itemm.ref):
                d3.append(itemmm.name + ' ' + itemmm.lastname)
                for itemmmm in User.objects.filter(inv=itemmm.ref):
                    d4.append(itemmmm.name + ' ' + itemmmm.lastname)
    acts=''
    for item in Subjects.objects.filter(userid = request.user.id):
        if item.act == 0 :
            acts = 'در حال بررسی'
        if item.act == 1 :
            acts = 'پاسخ داده شده'
        if item.act == 2 :
            acts = 'پاسخ  مشتری'
        if item.act == 3 :
            acts = 'بسته شده'
        subject.append([item.title , item.date , item.lastdate , acts,item.id , item.read])
    unread = 0 
    for item in Subjects.objects.filter(userid = request.user.id , read = False):
        unread = unread + 1
    arz = 0 
    for item in wallet.objects.filter(user = request.user.id ):
        arz = arz + 1
    fplan = 0 
    for item in bid.objects.filter(userid = request.user.id):
        fplan = fplan + 1
    plans = []
    for item1 in currencies.objects.all():
        plans.append([Plans.objects.filter(cur = item1.id) , item1.name , item1.pic])
    return render(request , "auctions/cpanel.html" , {
        'cur' : currencies.objects.all(),
        'bid' : bids,
        'mobilev' : mobilev,
        'emailv' : emailv,
        'idv' : idv,
        'bankv' : bankv,
        'mobilevc' : mobilevc,
        'emailvc' : emailvc,
        'idvc' : idvc,
        'bankvc' : bankvc,
        'melliv' : melliv,
        'mellivc' : mellivc,
        'bankv' : bankv,
        'bankvc' : bankvc,
        'wallet' : wa,
        'trans' : trans,
        'pro' : pro,
        'set' : settings.objects.get(id=1),
        'users' : User.objects.get(id = request.user.id),
        'inv' : inv,
        'pro' : pro,
        'd1': d1,
        'd2': d2,
        'subject' : subject,
        'unread' : unread,
        'fplan': fplan,
        'arz': arz,
        'tplan' : pages.objects.get(id=5).text,
        'addam' : pages.objects.get(id=6).text,
        'askam' : pages.objects.get(id=7).text, 
        'tiden' : pages.objects.get(id=8).text, 
        'tmojoodi' : pages.objects.get(id=9).text, 
        'sm' : pages.objects.get(id=10).text, 
        'st' : pages.objects.get(id=11).text, 
        'majmooe' : pages.objects.get(id=12).text, 
        'plans' : plans
    })


@user_passes_test(lambda user: user.is_superuser , login_url='login')
def adminpanel(request):
    mellis = []
    banks = []
    addamountreq = []
    askamountreq = []
    trans = []
    eplans = []
    pro = []
    transaction = Transactions.objects.all()
    for transa in transaction:
        if transa.act == 0 :
            act = 'برداشت'
            act = 'red'
        else:
            act = 'واریز'
            actc= 'green'
        trans.append([currencies.objects.get(id = transa.curid).pic, transa.amount,transa.date,act,actc,User.objects.get(id = transa.userid).name +' '+ User.objects.get(id = transa.userid).lastname])


    vermelli = Adminverifymelli.objects.filter(action = False)
    verbank = Adminverifybank.objects.filter(action = False)
    for melli in Adminverifymelli.objects.filter(action = False):
        mellis.append([melli.userid , melli.mellic , melli.melliimg , User.objects.get(id = melli.userid).name , User.objects.get(id = melli.userid).lastname , melli.id])
        

    for bank in Adminverifybank.objects.filter(action = False):
        banks.append([bank.userid , bank.bankc , bank.bankimg , User.objects.get(id = bank.userid).name , User.objects.get(id = bank.userid).lastname , bank.id])

    for req in Addamountreq.objects.all() :
        cur = currencies.objects.get(id = req.curid).pic
        username = User.objects.get(id = req.userid).name
        userlastname = User.objects.get(id = req.userid).lastname
        userid = User.objects.get(id = req.userid).id
        addamountreq.append([username , userlastname , cur , req.amount , req.link , userid , req.curid , req.id])

    for req in Askamountreq.objects.all() :
        cur = currencies.objects.get(id = req.curid).pic
        username = User.objects.get(id = req.userid).name
        userlastname = User.objects.get(id = req.userid).lastname
        userid = User.objects.get(id = req.userid).id
        askamountreq.append([username , userlastname , cur , req.amount , req.link , userid , req.curid , req.id])


    for eplan in Plans.objects.all():
        eplans.append([eplan.title ,currencies.objects.get(id = eplan.cur ).name ,eplan.percent,eplan.period , eplan.id ])

    for eplan in profitlist.objects.all():
        
        if(Plans.objects.filter(id = eplan.planid )):
            plant = Plans.objects.get(id = eplan.planid ).title
            cur = currencies.objects.get(id = Plans.objects.get(id = eplan.planid ).cur).pic 
        else:
            if(len(User.objects.filter(id = eplan.invid ))>0):
                plant = " سود حاصل از زیرمجموعه : "  + User.objects.get(id = eplan.invid ).name + ' ' + User.objects.get(id = eplan.invid ).lastname 
                cur = currencies.objects.get(id = eplan.curid).pic 
            else:
                plant = " سود حاصل از زیرمجموعه  " 
                cur = currencies.objects.get(id = eplan.curid).pic 
        pro.append([User.objects.get(id = eplan.userid).name + User.objects.get(id = eplan.userid).lastname , plant ,eplan.amount,eplan.date,cur])
    subject = []
    for item in Subjects.objects.all().order_by('aread','-lastdate'):
        if item.act == 0 :
            acts = 'در حال بررسی'
        if item.act == 1 :
            acts = 'پاسخ داده شده'
        if item.act == 2 :
            acts = 'پاسخ  مشتری'
        if item.act == 3 :
            acts = 'بسته شده'
        subject.append([item.title , item.date , item.lastdate , acts,item.id , User.objects.get(id = item.userid).username,item.aread])
    unread = 0 
    for item in Subjects.objects.filter(userid = request.user.id , aread = False):
        unread = unread + 1
    
    return render(request , "auctions/adminpanel.html" ,{
        "plans" : Plans.objects.all(),
        "eplans" : eplans,
        'cur' : currencies.objects.all(),
        'melli' : mellis,
        'bank' : banks,
        'amountreq' : addamountreq,
        'askamountreq' : askamountreq,
        'trans' : trans,
        'set' : settings.objects.get(id=1),
        'post' : post.objects.all(),
        'page' : pages.objects.all(),
        'use' : User.objects.all().order_by('id'),
        'pro' : pro,
        'subject': subject,
        'unread' : unread,
        'bazdid' : len(bazdid.objects.all()),
        'bazdidroz' : len(bazdid.objects.filter(date__gte= timezone.now() - timezone.timedelta(days=1) )),
        'bazdidhafte' : len(bazdid.objects.filter(date__gte= timezone.now() - timezone.timedelta(days=7) )),
        'users' : len(User.objects.all()),
        'job' : Job.objects.all()
    })


def buy(request):
    userid = request.POST['userid']
    planid = request.POST['planid']
    deposit = request.POST['amount']
    option = request.POST['option']
    cur = Plans.objects.get(id=planid).cur
    if(len(wallet.objects.filter(user = request.user.id , curid = cur))>0):
        havings = wallet.objects.get(user = request.user.id , curid = cur)
        if (float(deposit) <= float(havings.amount)):
            buy = bid.objects.create(userid=userid , planid=planid , deposit=deposit , option = option)
            havings.amount = havings.amount - float(deposit)
            havings.save()
            return render(request , "auctions/message.html" ,{
                "m": "پلن با موفقیت برای شما ثبت شد",
                'set' : settings.objects.get(id=1)
            })
        else:
            return render(request , "auctions/message.html" ,{
                "m": " دارایی کیف پول مربوط به این پلن کافی نیست لطفا کیف پول خود را شارژ کنید",
                'set' : settings.objects.get(id=1)
            })
    else:
        wal = wallet(user = request.user.id , curid = cur , amount = 0)
        wal.save()
        return render(request , "auctions/message.html" ,{
            "m": " دارایی کیف پول مربوط به این پلن کافی نیست لطفا کیف پول خود را شارژ کنید",
            'set' : settings.objects.get(id=1)
        })



def verifyemail(request):
    if request.method == "GET":
        user = Verify.objects.get(userid= request.user.id)
        vcode = randrange(999999)
        user.emailc = vcode
        user.save()
        response_data = {}
        response_data['result'] = 'Create post successful!'
        send_mail(
            'Subject here',
            f'به شرکت سرمایه گذاری ... خوش آمدید کد فعالسازی : {vcode} ',
            'info@ramabit.com',
            [f'{user.email}'],
            fail_silently=False,
        )
    if request.method == "POST":
        user = Verify.objects.get(userid= request.user.id)
        if(int(request.POST['code']) == int(user.emailc)):
            user.emailv = True
            user.save()
            if (user.melliv == 3 and  user.bankv == 3  and user.mobilev == True ):
                per = User.objects.get(id = userid)
                per.is_verified = True
            return render(request, "auctions/cpanelmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })
        else:
            return render(request, "auctions/cpanelmsg.html" , {
            "m": "کد وارد شده معتبر نیست",
            'set' : settings.objects.get(id=1)
            })


def verifymobile(request):

    if request.method == "GET":
        user = Verify.objects.get(userid= request.user.id)
        vcode = randrange(999999)
        user.mobilec = vcode
        user.save()

        api_key = "HpmWk_fgdm_OnxGYeVpNE1kmL8fTKC7Fu0cuLmeXQHM="

        sms = Client(api_key)

        bulk_id = sms.send(
        "+983000505",         
        [f"{request.user.mobile}"],    
        f'به شرکت سرمایه گذاری ... خوش آمدید کد فعالسازی : {vcode} ' 
        )

        message = sms.get_message(bulk_id)
    if request.method == "POST":
        user = Verify.objects.get(userid= request.user.id)
        if(int(request.POST['code']) == int(user.mobilec)):
            user.mobilev = True
            user.save()
            if (user.melliv == 3 and  user.bankv == 3 and user.emailv == True ):
                per = User.objects.get(id = userid)
                per.is_verified = True
            return render(request, "auctions/cpanelmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })
        else:
            return render(request, "auctions/cpanelmsg.html" , {
            "m": "کد وارد شده معتبر نیست",
            'set' : settings.objects.get(id=1)
            })


def verifymelli(request):
    if request.method == 'GET':
        return render(request, template)
    if request.method == "POST":
        img = request.FILES['melliimg']
        code = request.POST['melli']
        if(Adminverifymelli.objects.filter(userid = request.user.id).exists()):
            veri= Adminverifymelli.objects.get(userid = request.user.id)
            veri.melliimg = img
            veri.mellic = code
            veri.save()
        else:
            adminv = Adminverifymelli.objects.create(userid = request.user.id , melliimg = img , mellic = code)
        user = Verify.objects.get(userid = request.user.id)
        user.melliv = 1
        user.save()
        return render(request, "auctions/cpanelmsg.html" , {
            'set' : settings.objects.get(id=1),
            "m": "با موفقیت انجام شد"
        })


@user_passes_test(lambda user: user.is_superuser , login_url='login')
def verifymellicheck(request):
    userid = request.POST['userid']
    idm = request.POST['idm']
    ans = request.POST['ans']
    user = Verify.objects.get(userid = userid)
    user.melliv = ans
    user.save()
    req = Adminverifymelli.objects.get(id = idm)
    req.action = True
    req.save()
    if (user.bankv == 3  and user.mobilev == True  and user.emailv == True ):
        per = User.objects.get(id = userid)
        per.is_verified = True
    return render(request, "auctions/cpanelmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })



@user_passes_test(lambda user: user.is_superuser , login_url='login')
def verifybankcheck(request):
    userid = request.POST['userid']
    idm = request.POST['idm']
    ans = request.POST['ans']
    user = Verify.objects.get(userid = userid)
    user.bankv = ans
    user.save()
    req = Adminverifybank.objects.get(id = idm)
    req.action = True
    req.save()
    if (user.melliv == 3 and user.mobilev == True  and user.emailv == True ):
        per = User.objects.get(id = userid)
        per.is_verified = True
    return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })

def verifybank(request):
    if request.method == 'GET':
        return render(request, template)
    if request.method == "POST":
        img = request.FILES['bankimg']
        code = request.POST['bank']
        adminv = Adminverifybank.objects.create(bankimg = img , bankc = code)
        return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })



def gotogate(request):
    # خواندن مبلغ از هر جایی که مد نظر است
    amount = 10000000
    # تنظیم شماره موبایل کاربر از هر جایی که مد نظر است

    factory = bankfactories.BankFactory()
    bank = factory.create() # or factory.create(bank_models.BankType.BMI) or set identifier
    bank.set_request(request)
    bank.set_amount(amount)
    # یو آر ال بازگشت به نرم افزار برای ادامه فرآیند
    bank.set_client_callback_url(reverse('callback-gateway'))

    bank_record = bank.ready()
    
    return bank.redirect_gateway()


def callback_gateway_view(request):
    tracking_code = request.GET.get(settings.TRACKING_CODE_QUERY_PARAM, None)
    if not tracking_code:
        logging.debug("این لینک معتبر نیست.")
        raise Http404

    try:
        bank_record = bank_models.Bank.objects.get(tracking_code=tracking_code)
    except bank_models.Bank.DoesNotExist:
        logging.debug("این لینک معتبر نیست.")
        raise Http404

    # در این قسمت باید از طریق داده هایی که در بانک رکورد وجود دارد، رکورد متناظر یا هر اقدام مقتضی دیگر را انجام دهیم
    if bank_record.is_success:
        # پرداخت با موفقیت انجام پذیرفته است و بانک تایید کرده است.
        # می توانید کاربر را به صفحه نتیجه هدایت کنید یا نتیجه را نمایش دهید.
        return HttpResponse("پرداخت با موفقیت انجام شد.")

    # پرداخت موفق نبوده است. اگر پول کم شده است ظرف مدت ۴۸ ساعت پول به حساب شما بازخواهد گشت.
    return HttpResponse("پرداخت با شکست مواجه شده است. اگر پول کم شده است ظرف مدت ۴۸ ساعت پول به حساب شما بازخواهد گشت.")


@user_passes_test(lambda user: user.is_superuser , login_url='login')
def deletecur(request):
    iden = request.POST['id']
    cur = currencies.objects.get(id = iden)
    cur.delete()
    return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })

def addamountreq(request):
    link = request.POST['link']
    amount = request.POST['amount']
    userid = request.POST['userid']
    curid = request.POST['curid']
    add = Addamountreq(link=link , amount = amount ,userid = userid , curid = curid)
    add.save()
    return render(request, "auctions/cpanelmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })

def askamountreq(request):
    link = request.POST['link']
    amount = request.POST['amount']
    userid = request.POST['userid']
    curid = request.POST['curid']
    add = Askamountreq(link=link , amount = amount ,userid = userid , curid = curid)
    add.save()

    return render(request, "auctions/cpanelmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })

@user_passes_test(lambda user: user.is_superuser , login_url='login')
def amountreqcheck(request):
    amount = request.POST['amount']
    userid = request.POST['userid']
    curid = request.POST['curid']
    ans = request.POST['ans']
    idm = request.POST['idm']
    set = settings.objects.all()[0]
    if(int(ans) == 2):
        req = Addamountreq.objects.get(id = idm)
        req.delete()
        return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت رد شد",
            'set' : settings.objects.get(id=1)
        })
    if(wallet.objects.filter(user = userid , curid = curid)):
        wal = wallet.objects.get(user = userid , curid = curid)
        wal.amount = float(wal.amount) + float(amount)
        wal.save()
        req = Addamountreq.objects.get(id = idm)
        req.delete()
        trans = Transactions(userid = userid , curid = curid ,amount = amount , act = 1)
        trans.save()
    else:
        wal = wallet(user = userid , curid = curid , amount = amount)
        wal.save()
        req = Addamountreq.objects.get(id = idm)
        req.delete()
        trans = Transactions(userid = userid , curid = curid ,amount = amount , act = 1)
        trans.save()
    if(User.objects.get(id = userid).inv):
        firstinv = User.objects.get(ref = User.objects.get(id = userid).inv)
        if(wallet.objects.filter(user = firstinv.id , curid = curid)):
            wal2 = wallet.objects.get(user = firstinv.id , curid = curid)
            wal2.amount = float(wal2.amount) + float(amount)* 0.02
            wal2.save()
            trans = profitlist(userid = firstinv.id ,invid = userid, curid = curid ,amount = float(amount)* 0.02)
            trans.save()
        else:
            wal2 = wallet(user = firstinv.id , curid = curid , amount = float(amount)*  0.02)
            wal2.save()
            trans = profitlist(userid = firstinv.id ,invid = userid, curid = curid ,amount = float(amount)*   0.02)
            trans.save()     
        if(firstinv.inv):
            secondinv = User.objects.get(ref = firstinv.inv)
            if(wallet.objects.filter(user = secondinv.id , curid = curid)):
                wal3 = wallet.objects.get(user = secondinv.id , curid = curid)
                wal3.amount = float(wal3.amount) + float(amount)* 0.01
                wal3.save()
                trans = profitlist(userid = secondinv.id ,invid = userid, curid = curid ,amount = float(amount)* 0.01 )
                trans.save()
            else:
                wal3 = wallet(user = secondinv.id , curid = curid , amount = float(amount)* 0.01)
                wal3.save()
                trans = profitlist(userid = secondinv.id ,invid = userid, curid = curid ,amount = float(amount)* 0.01 )
                trans.save()
            if(secondinv.inv):
                thirdinv = User.objects.get(ref = secondinv.inv)
                if(wallet.objects.filter(user = thirdinv.id , curid = curid)):
                    wal4 = wallet.objects.get(user = thirdinv.id , curid = curid)
                    wal4.amount = float(wal4.amount) + float(amount)* 0.005
                    wal4.save()
                    trans = profitlist(userid = thirdinv.id ,invid = userid, curid = curid ,amount = float(amount)* 0.005 )
                    trans.save()
                else:
                    wal4 = wallet(user = thirdinv.id , curid = curid , amount = float(amount)* 0.005)
                    wal4.save()
                    trans = profitlist(userid = thirdinv.id ,invid = userid, curid = curid ,amount = float(amount)* 0.005 )
                    trans.save()
                    if(thirdinv.inv):
                        fourth = User.objects.get(ref = thirdinv.inv)
                        if(wallet.objects.filter(user = fourth.id , curid = curid)):
                            wal5 = wallet.objects.get(user = fourth.id , curid = curid)
                            wal5.amount = float(wal5.amount) + float(amount)* 0.0025
                            wal5.save()
                            trans = profitlist(userid = fourth.id ,invid = userid, curid = curid ,amount = float(amount)* 0.0025 )
                            trans.save()
                        else:
                            wal5 = wallet(user = fourth.id , curid = curid , amount = float(amount)* 0.0025)
                            wal5.save()
                            trans = profitlist(userid = fourth.id ,invid = userid, curid = curid ,amount = float(amount)* 0.0025 )
                            trans.save()
    return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })

    
@user_passes_test(lambda user: user.is_superuser , login_url='login')
def askamountreqcheck(request):
    amount = request.POST['amount']
    userid = request.POST['userid']
    curid = request.POST['curid']
    ans = request.POST['ans']
    idm = request.POST['idm']
    if(int(ans) == 2):
        req = Askamountreq.objects.get(id = idm)
        req.delete()
        return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت رد شد",
            'set' : settings.objects.get(id=1)
        })
    wal = wallet.objects.get(user = userid , curid = curid)
    wal.amount = float(wal.amount) - float(amount)
    wal.save()
    req = Askamountreq.objects.get(id = idm)
    req.delete()
    trans = Transactions(userid = userid , curid = curid ,amount = amount , act = 2)
    trans.save()
    return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })





def closeplan(request):
    bidid = request.POST['bidid']
    bids = bid.objects.get(id = bidid)
    plans = Plans.objects.get(id = bids.planid)
    if plans.period == 'half-year':
        return render(request, "auctions/cpanelmsg.html" , {
            "m": "برای لغو این پلن تیکت ثبت کنید",
            'set' : settings.objects.get(id=1)
        })
        
    elif plans.period == 'year':
        return render(request, "auctions/cpanelmsg.html" , {
            "m": "برای لغو این پلن تیکت ثبت کنید",
            'set' : settings.objects.get(id=1)
        })
        
    else:
        wall = wallet.objects.get(user = bids.userid , curid = plans.cur)
        wall.amount = wall.amount + bids.deposit
        wall.save()
        bids.delete()
        
    return render(request, "auctions/cpanelmsg.html" , {
                "m": "با موفقیت انجام شد",
                'set' : settings.objects.get(id=1)
            })
def closeplanadmin(request):
    bidid = request.POST['bidid']
    mablagh = request.POST['mablagh']
    bids = bid.objects.get(id = bidid)
    plans = Plans.objects.get(id = bids.planid)
    wall = wallet.objects.get(user = bids.userid , curid = plans.cur)
    wall.amount = wall.amount + float(mablagh)
    wall.save()
    bids.delete()
        
    return render(request, "auctions/usermsg.html" , {
                "m": "با موفقیت انجام شد",
                'set' : settings.objects.get(id=1),
                'user' : bids.userid
            })

def addpost(request):
    if(request.method == 'POST'):
        title = request.POST['title']
        des = request.POST['des']
        pic = request.FILES['pic']
        place = request.POST['place']
        po = post(title = title , text = des , pic = pic , place = place)
        po.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "Added Successfully",
            'set' : settings.objects.get(id=1)
        })

def blog(request):
    return render(request, "auctions/blog.html" , {
        "home" : post.objects.all(),
        'set' : settings.objects.get(id=1)
        
    })
def contact(request):
    return render(request, "auctions/contact.html" , {
        'set' : settings.objects.get(id=1)
    })
def about(request):
    return render(request, "auctions/about.html" , {
        'set' : settings.objects.get(id=1),
        'page': pages.objects.get(id=13)
    })


@user_passes_test(lambda user: user.is_superuser , login_url='login')
def setting(request):
    if(request.method == 'POST'):
        name = request.POST['name']
        tel = request.POST['phone']
        address = request.POST['address']
        email = request.POST['email']
        instagram = request.POST['instagram']
        telegram = request.POST['telegram']
        whatsapp = request.POST['whatsapp']
        facebook = request.POST['facebook']
        s1 = request.POST['s1']
        s2 = request.POST['s2']
        s3 = request.POST['s3']
        s4 = request.POST['s4']
        po = settings.objects.get(id=1)
        if 'pic' in request.FILES:
            logo = request.FILES['logo']
            po.logo = logo
        po.name = name 
        po.tel = tel 
        po.address = address 
        po.email = email 
        po.telegram = telegram 
        po.whatsapp = whatsapp 
        po.instagram = instagram 
        po.facebook = facebook
        po.s1 = s1
        po.s2 = s2
        po.s3 = s3
        po.s4 = s4
        po.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "Added Successfully",
            'set' : settings.objects.get(id=1)
        })



@user_passes_test(lambda user: user.is_superuser , login_url='login')
def postedit(request , id):
        if(request.method == 'POST'):
            title = request.POST['title']
            des = request.POST['des']
            po = post.objects.get(id = id)
            po.title = title 
            po.text = des 
            po.save()
            return render(request, "auctions/adminmsg.html" , {
                "m": " با موفقیت ویرایش شد",
                'set' : settings.objects.get(id=1)
            })
        else:
            auc = post.objects.get(id = id)
            return render(request , "auctions/postedit.html" , {
                'post' : auc,
                'set' : settings.objects.get(id=1)
            })
            
            
@user_passes_test(lambda user: user.is_superuser , login_url='login')
def postdelete(request , id):
        po = post.objects.get(id = id)
        po.delete()
        return render(request, "auctions/adminmsg.html" , {
            "m": "با موفقیت حذف شد",
            'set' : settings.objects.get(id=1)
        })

@user_passes_test(lambda user: user.is_superuser , login_url='login')
def user(request , id):
    n = '#FF0000'
    s = '#00ff00'
    userid = id
    wa = []
    trans = []
    bids = []
    user = Verify.objects.get(userid=id)
    wall = wallet.objects.filter(user = id)
    bi = bid.objects.filter(userid = id).order_by('-date_field')
    for bii in bi :    
        bids.append([currencies.objects.get(id = Plans.objects.get(id = bii.planid).cur).pic , bii.deposit ,bii.date_field, Plans.objects.get(id = bii.planid).period ,Plans.objects.get(id = bii.planid).percent , bii.id])
    
    for cur in currencies.objects.all():
        if(len(wallet.objects.filter(user = id , curid= cur.id))>0):
            wal = wallet.objects.get(user = id , curid= cur.id)
            wa.append([cur.pic , wal.amount , cur.brand,cur.id])
        else:
            wa.append([cur.pic , 0 , cur.brand , cur.id] )
        
        
    transaction = Transactions.objects.filter(userid = id)
    for transa in transaction:
        if transa.act == 0 :
            act = 'برداشت'
            act = 'red'
        else:
            act = 'واریز'
            actc= 'green'
        trans.append([currencies.objects.get(id = transa.curid).pic, transa.amount,transa.date,act,actc])
    if user.mobilev == True : 
        mobilev = 'تایید شده' 
        mobilevc = s
    else: 
        mobilev = 'تایید نشده'
        mobilevc = n
    if user.emailv == True : 
        emailv = 'تایید شده' 
        emailvc = s
    else:
        emailv = 'تایید نشده'
        emailvc = n
    if user.mobilev == True : 
        idv = 'تایید شده' 
        idvc = s
    else: 
        idv = 'تایید نشده'
        idvc = n
    if user.mobilev == True : 
        bankv = 'تایید شده' 
        bankvc = s
    else: 
        bankv = 'تایید نشده'
        bankvc = n
    if user.melliv == 0 : 
        melliv = 'تایید نشده'
        mellivc = n
    elif user.melliv == 1 : 
        melliv = 'در انتظار تایید '
        mellivc = n
    elif user.melliv == 2 : 
        melliv = 'رد شده '
        mellivc = n
    elif user.melliv == 3 : 
        melliv = 'تایید شده '
        mellivc = s
    if user.bankv == 0 : 
        bankv = 'تایید نشده'
        bankvc = n
    elif user.bankv == 1 : 
        bankv = 'در انتظار تایید '
        bankvc = n
    elif user.bankv == 2 : 
        bankv = 'رد شده '
        bankvc = n
    elif user.bankv == 3 : 
        bankv = 'تایید شده '
        bankvc = s

    pro = []
    
    for eplan in profitlist.objects.filter(userid = id).order_by('-date'):
        if(Plans.objects.filter(id = eplan.planid )):
            plant = Plans.objects.get(id = eplan.planid ).title
            cur = currencies.objects.get(id = Plans.objects.get(id = eplan.planid ).cur).pic 
        else:
            if(len(User.objects.filter(id = eplan.invid ))>0):
                plant = " سود حاصل از زیرمجموعه : "  + User.objects.get(id = eplan.invid ).name + ' ' + User.objects.get(id = eplan.invid ).lastname 
                cur = currencies.objects.get(id = eplan.curid).pic 
            else:
                plant = " سود حاصل از زیرمجموعه  " 
                cur = currencies.objects.get(id = eplan.curid).pic 
        pro.append([User.objects.get(id = eplan.userid).name + User.objects.get(id = eplan.userid).lastname , plant ,eplan.amount,eplan.date,cur])
    inv = ''
    
    if(User.objects.filter(ref = User.objects.get(id = id).inv).exists()):
        inv = User.objects.get(ref = User.objects.get(id = id).inv).lastname + User.objects.get(ref = User.objects.get(id = id).inv).name
    d1 = []
    d2 = []
    
    for item in User.objects.filter(inv=User.objects.get(id = id).ref):
        d1.append(item.lastname +'   '+ item.name)
        
    for itemm in User.objects.filter(inv=User.objects.get(id = id).ref):
        for itemmm in User.objects.filter(inv=itemm.ref):
            d2.append(itemmm.name + ' ' + itemmm.lastname)
            
    return render(request , "auctions/user.html" , {
        'cur' : currencies.objects.all(),
        'bid' : bids,
        'mobilev' : mobilev,
        'emailv' : emailv,
        'idv' : idv,
        'bankv' : bankv,
        'mobilevc' : mobilevc,
        'emailvc' : emailvc,
        'idvc' : idvc,
        'bankvc' : bankvc,
        'melliv' : melliv,
        'mellivc' : mellivc,
        'bankv' : bankv,
        'bankvc' : bankvc,
        'wallet' : wa,
        'trans' : trans,
        'pro' : pro,
        'set' : settings.objects.get(id=1),
        'users' : User.objects.get(id = id),
        'inv' : inv,
        'pro' : pro,
        'd1': d1,
        'd2': d2,
        'userid': userid,
    })
@user_passes_test(lambda user: user.is_superuser , login_url='login')
def adminincrease(request):
    amount = request.POST["amount"]
    curid = request.POST["curid"]
    userid = request.POST["userid"]
    
    if(wallet.objects.filter(user = userid , curid = curid)):
        wal = wallet.objects.get(user = userid , curid = curid)
        wal.amount = float(wal.amount) + float(amount)
        wal.save()
        trans = Transactions(userid = userid , curid = curid ,amount = amount , act = 1)
        trans.save()
    else:
        wal = wallet(user = userid , curid = curid , amount = amount)
        wal.save()
        trans = Transactions(userid = userid , curid = curid ,amount = amount , act = 1)
        trans.save()
    return render(request, "auctions/usermsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1),
            'user' : userid
        })

@user_passes_test(lambda user: user.is_superuser , login_url='login')
def admindecrease(request):
    amount = request.POST["amount"]
    curid = request.POST["curid"]
    userid = request.POST["userid"]
    
    
    if(wallet.objects.filter(user = userid , curid = curid)):
        wal = wallet.objects.get(user = userid , curid = curid)
        wal.amount = float(wal.amount) - float(amount)
        wal.save()
        trans = Transactions(userid = userid , curid = curid ,amount = amount , act = 2)
        trans.save()
    else:
        return render(request, "auctions/usermsg.html" , {
            "m": "   موجودی ندارد",
            'set' : settings.objects.get(id=1),
            'user' : userid
        })
    return render(request, "auctions/usermsg.html" , {
            "m": "با موفقیت انجام شد",
            'set' : settings.objects.get(id=1),
            'user' : userid
        })

@user_passes_test(lambda user: user.is_superuser , login_url='login')      
def adminverify(request):
    userid=request.POST['userid']
    act=request.POST['act']
    user = Verify.objects.get(userid = userid)
    if int(act) == 1 :
        user = Verify.objects.get(userid = userid)
        user.mobilev = True
        user.save()
        if (user.melliv == 3 and  user.bankv == 3 and user.emailv == True ):
            per = User.objects.get(id = userid)
            per.is_verified = True

        return render(request, "auctions/usermsg.html" , {
        "m": "با موفقیت انجام شد",
        'set' : settings.objects.get(id=1),
        'user' : userid
        })
    if int(act) == 2 :
        user.emailv = True
        user.save()
        if (user.melliv == 3 and  user.bankv == 3 and user.mobilev == True ):
            per = User.objects.get(id = userid)
            per.is_verified = True
        return render(request, "auctions/usermsg.html" , {
        "m": "با موفقیت انجام شد",
        'set' : settings.objects.get(id=1),
        'user' : userid
        })

    if int(act) == 3 :
        user.melliv = 3
        user.save()
        if (user.emailv == 3 and  user.bankv == 3 and user.mobilev == True ):
            per = User.objects.get(id = userid)
            per.is_verified = True
        return render(request, "auctions/usermsg.html" , {
        "m": "با موفقیت انجام شد",
        'set' : settings.objects.get(id=1),
        'user' : userid
        })

    if int(act) == 4 :
        user.bankv = 3
        user.save()
        if (user.emailv == 3 and  user.melliv == 3 and user.mobilev == True ):
            per = User.objects.get(id = userid)
            per.is_verified = True
        return render(request, "auctions/usermsg.html" , {
        "m": "با موفقیت انجام شد",
        'set' : settings.objects.get(id=1),
        'user' : userid
        })

    if int(act) == 5 :
        user.bankv = 3
        user.mobilev = True
        user.emailv = True
        user.melliv = 3
        user.save()
        per = User.objects.get(id = userid)
        per.is_verified = True
        per.save()
        return render(request, "auctions/usermsg.html" , {
        "m": "با موفقیت انجام شد",
        'set' : settings.objects.get(id=1),
        'user' : userid
        })
    return render(request, "auctions/usermsg.html" , {
        "m": "مشکلی ایجاد شده   ",
        'set' : settings.objects.get(id=1),
        'user' : userid
        })
        
def addticket(request):
    if(request.method == 'POST'):
        title = request.POST['title']
        des = request.POST['des']
        subject = Subjects(userid = request.user.id , title = title)
        subject.save()
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            ticket = Tickets(text = des , pic = pic,subid = subject.id)
        ticket = Tickets( text = des ,subid = subject.id)
        ticket.save()
        return render(request, "auctions/cpanelmsg.html" , {
            "m": "تیکت شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })
def ansticket(request):
    if(request.method == 'POST'):
        subid = request.POST['id']
        des = request.POST['des']
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            ticket = Tickets(text = des , pic = pic,subid = subject.id)
        ticket = Tickets( text = des ,subid = subid)
        ticket.save()
        sub = Subjects.objects.get(id = subid)
        sub.act = 2
        sub.aread = False
        sub.save()
        return render(request, "auctions/cpanelmsg.html" , {
            "m": "تیکت شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })
def aansticket(request):
    if(request.method == 'POST'):
        subid = request.POST['id']
        des = request.POST['des']
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            ticket = Tickets(text = des , pic = pic,subid = subject.id,sender=1)
        ticket = Tickets( text = des ,subid = subid, sender=1)
        ticket.save()
        sub = Subjects.objects.get(id = subid)
        sub.act = 1
        sub.read = False
        sub.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "تیکت شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })

def faddticket(request):
    if(request.method == 'POST'):
        ids = request.POST['ids']
        title = request.POST['title']
        des = request.POST['des']
        subject = Subjects(userid = ids , title = title , read = False , aread = True)
        subject.save()
        if 'pic' in request.FILES:
            pic = request.FILES['pic']
            ticket = Tickets(text = des , pic = pic,subid = subject.id)
        ticket = Tickets( text = des ,subid = subject.id)
        ticket.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "تیکت شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })
        
def fallticket(request):
    if(request.method == 'POST'):
        for ids in User.objects.all():
            title = request.POST['title']
            des = request.POST['des']
            subject = Subjects(userid = ids.id , title = title , read = False , aread = True)
            subject.save()
            if 'pic' in request.FILES:
                pic = request.FILES['pic']
                ticket = Tickets(text = des , pic = pic,subid = subject.id)
            ticket = Tickets( text = des ,subid = subject.id)
            ticket.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": "تیکت شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })


        return render(request, "auctions/adminmsg.html" , {
            "m": "تیکت شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })
        
def read(request,id):
    subid = id
    read = Subjects.objects.get(id = subid)
    read.read = True
    read.save()
    reads = Tickets.objects.filter(subid = subid)
    sendings = []
    for item in reads :
        if item.sender == 0 :
            sender = 'شما'
        if item.sender == 1 :
            sender = 'کارشناس'
        if item.pic:
            sendings.append([item.date , item.text ,  sender , item.pic.url])
        else:
            sendings.append([item.date , item.text , sender , '#'])
    return JsonResponse(sendings, safe=False)

def aread(request , id):
    subid = id
    read = Subjects.objects.get(id = subid)
    read.aread = True
    read.save()
    reads = Tickets.objects.filter(subid = subid)
    sendings = []
    for item in reads :
        if item.sender == 0 :
            sender = 'شما'
        if item.sender == 1 :
            sender = 'کارشناس'
        if item.pic:
            sendings.append([item.date , item.text ,  sender , item.pic.url])
        else:
            sendings.append([item.date , item.text , sender , '#'])
    return JsonResponse(sendings, safe=False)
    
def pageedit(request , id):
    if(request.method == 'POST'):
        title = request.POST['title']
        des = request.POST['des']
        po = pages.objects.get(id = id)
        po.title = title 
        po.text = des 
        po.save()
        return render(request, "auctions/adminmsg.html" , {
            "m": " با موفقیت ویرایش شد",
            'set' : settings.objects.get(id=1)
        })
    else:
        auc = pages.objects.get(id = id)
        return render(request , "auctions/pageedit.html" , {
            'post' : auc,
            'set' : settings.objects.get(id=1)
        })
def page(request,id):
    auc = pages.objects.get(id = id)
    return render(request , "auctions/page.html" , {
        'page' : auc,
        'set' : settings.objects.get(id=1)
    })
def userdelete(request,id):
    user = User.objects.get(id = id)
    Wallet = wallet.objects.filter(user = id)
    for item in Wallet :
        item.delete()
    Bid = bid.objects.filter(userid=id)
    for item in Bid :
        item.delete()
    verify = Verify.objects.filter(userid=id)
    for item in verify :
        item.delete()
    adminverifymelli = Adminverifymelli.objects.filter(userid=id)
    for item in adminverifymelli :
        item.delete()
    addamountreq = Addamountreq.objects.filter(userid=id)
    for item in addamountreq :
        item.delete()
    askamountreq = Askamountreq.objects.filter(userid=id)
    for item in askamountreq :
        item.delete()
    transactions = Transactions.objects.filter(userid=id)
    for item in transactions :
        item.delete()
    profit = profitlist.objects.filter(userid=id)
    for item in profit :
        item.delete()
    subjects = Subjects.objects.filter(userid=id)
    for item in subjects :
        tickets = Tickets.objects.filter(subid=item.id)
        for itemm in tickets :
            itemm.delete()
        item.delete()
    profit = profitlist.objects.filter(invid=id)
    for item in profit :
        item.invid = 0
        item.save()
    
    
    user.delete()
    return render(request, "auctions/adminmsg.html" , {
            "m": " با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })
def userblock(request,id):
    user = User.objects.get(id = id)
    user.is_active = False
    user.save()
    return render(request, "auctions/adminmsg.html" , {
            "m": " با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })
def userunblock(request,id):
    user = User.objects.get(id = id)
    user.is_active = True
    user.save()
    return render(request, "auctions/adminmsg.html" , {
            "m": " با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })
def addjob(request):
    if(request.method == 'POST'):
        title = request.POST['title']
        des = request.POST['des']
        jobs= request.POST['job']
        job = Job(userid = request.user.id ,username = request.user.username , title = title , text = des ,job = jobs)
        job.save()
        return render(request, "auctions/cpanelmsg.html" , {
            "m": "تیکت شما با موفقیت ثبت شد",
            'set' : settings.objects.get(id=1)
        })
def changepass(request):
    from django.contrib.auth.hashers import PBKDF2PasswordHasher
    opass = request.POST["opassword"]
    passw = request.POST["password"]
    repassw = request.POST["repassword"]
    user = request.user
    if passw == repassw:
        usercheck = authenticate(request, username=user.username, password=opass)
        if usercheck == None:
            return render(request, "auctions/cpanelmsg.html" , {
                "m": "پسورد فعلی وارد شده غلط است",
                'set' : settings.objects.get(id=1)
            })
        passs = make_password(str(passw))
        user.password = passs
        user.save()
        return render(request, "auctions/cpanelmsg.html" , {
            "m": " با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })
    return render(request, "auctions/cpanelmsg.html" , {
            "m": " تایید پسورد وارد شده غلط است",
            'set' : settings.objects.get(id=1)

        })
def adminchangepass(request):
    from django.contrib.auth.hashers import PBKDF2PasswordHasher
    passw = request.POST["password"]
    repassw = request.POST["repassword"]
    user = User.objects.get(id=request.POST["userid"])
    if passw == repassw:
        passs = make_password(str(passw))
        user.password = passs
        user.save()
        return render(request, "auctions/cpanelmsg.html" , {
            "m": " با موفقیت انجام شد",
            'set' : settings.objects.get(id=1)
        })
    return render(request, "auctions/cpanelmsg.html" , {
            "m": " تایید پسورد وارد شده غلط است",
            'set' : settings.objects.get(id=1)
        })

def forgetreq(request):
    if(request.method == 'GET'):
        return render(request, "auctions/forgetreq.html",{
            'set' : settings.objects.get(id=1)
        })
    else:
        if(len(User.objects.filter(email = request.POST['email']))<1):
            return render(request, "auctions/cpanelmsg.html" , {
                "m": "کاربر با ایمیل وارد شده یافت نشد",
                'set' : settings.objects.get(id=1)
        })
        serializer = Forget(email=request.POST['email'])
        serializer.save()
        email = request.POST['email']
        key = Forget.objects.filter(email = email).reverse()[0].key
        response_data = {}
        response_data['result'] = 'Create post successful!'
        send_mail(
        'Subject here',
        f'لینک بازیابی رمز عبور شما : http://ramabit.com/resetpass/{key} ',
        'info@ramabit.com',
        [f'{email}'],
        fail_silently=False,
        )
        return render(request, "auctions/cpanelmsg.html" , {
            "m": "لینک تغییر کلمه عبور با موفقیت  به ایمیل شما ارسال شد",
            'set' : settings.objects.get(id=1)
        })
def resetpass(request , key):
    if(request.method == 'GET'):
        return render(request, "auctions/resetpass.html" , {
            "key": key,
            'set' : settings.objects.get(id=1)
        })
        
    else:
        key = request.POST['key']
        if(len(Forget.objects.filter(key = request.POST['key']))<1):
            return render(request, "auctions/cpanelmsg.html" , {
            "m": "لینک استفاده شده معتبر نیست",
            'set' : settings.objects.get(id=1)
        })
        user = User.objects.get(email = Forget.objects.get(key = request.POST['key']).email)
        passw = request.POST['password']
        repassw = request.POST['repassword']
        if passw == repassw:
            passs = make_password(str(passw))
            user.password = passs
            user.save()
            Forget.objects.get(key = request.POST['key']).delete()
            return redirect(f"http://ramabit.com/login")  