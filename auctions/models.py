from django.contrib.auth.models import BaseUserManager, AbstractUser
from django.db import models
from django.utils import timezone
import uuid
from commerce.settings import ROOT
from ckeditor.fields import RichTextField

class bazdid(models.Model):
    date = models.DateField(default=timezone.now)
    count = models.IntegerField(null=True)


class MyUserManager(BaseUserManager):
    def create_user(self,username, mobile,name,lastname, password=None):

        user = self.model(
            mobile = mobile,
            username = username,
            name = name,
            lastname = lastname
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, date_of_birth, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            email,
            password=password,
            date_of_birth=date_of_birth,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class User(AbstractUser):
    first_name = None
    last_name = None
    ref = models.CharField(
        default=uuid.uuid4, unique=True, max_length=100, verbose_name="REF"
    )
    username = models.CharField(max_length=100, null=True, unique=True)
    inv = models.CharField(max_length=100, null=True)
    name = models.CharField(max_length=100, null=True, verbose_name="نام")
    lastname = models.CharField(max_length=100, null=True, verbose_name="نام خانوادگی")
    mobile = models.CharField(null=True, verbose_name="موبایل", max_length=100)
    is_active = models.BooleanField(default=True)
    is_verified = models.BooleanField(default=False)
    REQUIRED_FIELDS = ["name", "lastname", "mobile"]

    objects = MyUserManager()

    def __str__(self):
        return f"({self.id}){self.username}"



class currencies(models.Model):
    name = models.CharField(max_length=100, verbose_name=" نام ارز")
    brand = models.CharField(max_length=100, null=True, verbose_name=" نماد ارز")
    pic = models.ImageField(upload_to="cur", null=True)
    qr = models.ImageField(upload_to="cur", null=True)
    address = models.CharField(max_length=1000, null=True)
    price = models.FloatField(default = 0)

    def __str__(self):
        return self.brand

    def get_image(self):
        return ROOT + "/media/" + self.pic.name
    
    def get_qr(self):
        return ROOT + "/media/" + self.qr.name


class wallet(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    currency = models.ForeignKey(currencies, on_delete=models.CASCADE, null=True)
    amount = models.FloatField(default=0)



    def __str__(self):
        return f"({self.id}){self.user} {self.amount}"


class Plans(models.Model):
    title = models.CharField(max_length=100)
    currency = models.ForeignKey(currencies, on_delete= models.CASCADE, null=True)
    des = models.TextField(max_length=10000)
    percent = models.FloatField(null=True)
    mini = models.FloatField(null=True)
    maxi = models.FloatField(null=True)
    period = models.CharField(null=True, max_length=100)

    def get_cur(self):
        return self.currency.brand
    
    def get_image(self):
        return self.currency.get_image()

    def __str__(self):
        return f"{self.title} ({self.id})"



class Miners(models.Model):
    title = models.CharField(max_length=100)
    pic = models.ImageField(upload_to="miner")
    currency = models.ForeignKey(currencies, on_delete= models.CASCADE)
    des = models.TextField(max_length=10000)
    rate = models.FloatField(null=True)
    period = models.CharField(null=True, max_length=100)
    price = models.FloatField( default = 0)
    profit = models.FloatField( default = 0)

    def __str__(self):
        return f"{self.title} ({self.id})"

    def get_pic(self):
        return  ROOT + '/media/' + self.pic.name

    def get_cur_pic(self):
        return  ROOT + '/media/' + self.currency.pic.name
    
    def get_cur(self):
        return  self.currency.brand


class Product(models.Model):
    title = models.CharField(max_length=100)
    pic = models.ImageField(upload_to="miner")
    des = models.TextField(max_length=10000)
    price = models.FloatField( default = 0)

    def __str__(self):
        return f"{self.title} ({self.id})"

    def get_image(self):
        return  ROOT + '/media/' + self.pic.name


class ProductOrder(models.Model):
    firs_name = models.CharField(max_length=100)
    last_name = models.ImageField(upload_to="products")
    address = models.TextField(max_length=10000)
    postal_code = models.TextField(max_length=10)

    def __str__(self):
        return f"{self.title} ({self.id})"

    def get_pic(self):
        return  ROOT + '/media/' + self.pic.name



class bid(models.Model):
    plan = models.ForeignKey(Plans, on_delete=models.CASCADE, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    deposit = models.FloatField()
    option = models.CharField(max_length=100, null=True)
    date_field = models.DateField(default=timezone.now)

    def get_image(self):
        return self.plan.currency.get_image()

    def __str__(self):
        return f"{self.user}   ,   {self.plan}   ,   {self.deposit}   ,   {self.date_field}"


class Cat(models.Model):
    name = models.CharField(max_length=100, primary_key=True)

    def __str__(self):
        return f"{self.name}"


class act(models.Model):
    aucid = models.IntegerField(auto_created=True, primary_key=True)
    act = models.IntegerField(default=1)

    def __str__(self):
        return f"{self.aucid} , {self.act}"


class Verify(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    mobilev = models.BooleanField(default=False, null=True)
    mobilec = models.IntegerField(null=True)
    emailv = models.BooleanField(default=False, null=True)
    emailc = models.IntegerField(null=True)
    melliv = models.IntegerField(default=0, null=True)
    bankv = models.IntegerField(default=0, null=True)


class Adminverifymelli(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    melliimg = models.ImageField(upload_to="melli", null=True)
    mellic = models.IntegerField(null=True)
    action = models.BooleanField(default=False)

    def get_image(self):
        return  ROOT + '/media/' + self.melliimg.name


class Adminverifybank(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    bankimg = models.ImageField(upload_to="bank", null=True)
    bankc = models.IntegerField(null=True)
    action = models.BooleanField(default=False)

    def get_image(self):
        return  ROOT + '/media/' + self.bankimg.name


class Addamountreq(models.Model):
    
    currency = models.ForeignKey(currencies, on_delete=models.CASCADE, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    amount = models.FloatField()
    link = models.CharField(max_length=1000, null=True)


class Askamountreq(models.Model):
    
    currency = models.ForeignKey(currencies, on_delete=models.CASCADE, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    amount = models.FloatField()
    link = models.CharField(max_length=1000, null=True)


class Transactions(models.Model):
    date = models.DateField(default=timezone.now)
    amount = models.FloatField()
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    
    currency = models.ForeignKey(currencies, on_delete=models.CASCADE, null=True)
    act = models.IntegerField(null=True)


class blog(models.Model):
    date = models.DateField(default=timezone.now)
    title = models.CharField(max_length=100)
    text = models.CharField(max_length=10000)
    pic = models.ImageField(upload_to="blog")


class post(models.Model):
    date = models.DateField(default=timezone.now)
    title = models.CharField(max_length=100)
    text = models.CharField(max_length=10000)
    pic = models.ImageField(upload_to="blog")
    place = models.CharField(default="normal", max_length=100)
    app = models.BooleanField(default=False)
    index = models.BooleanField(default=False)

    def get_image(self):
        return  ROOT + '/media/' + self.pic.name


class News(models.Model):
    date = models.DateField(default=timezone.now)
    title = models.CharField(max_length=100)
    text = models.CharField(max_length=10000)
    pic = models.ImageField(upload_to="blog")
    place = models.CharField(default="normal", max_length=100)

    def get_image(self):
        return  ROOT + '/media/' + self.pic.name


class Banner(models.Model):
    title = models.CharField(max_length=100)
    pic = models.ImageField(upload_to="blog")

    def get_image(self):
        return  ROOT + '/media/' + self.pic.name






class settings(models.Model):
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=300)
    tel = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    telegram = models.CharField(max_length=300)
    whatsapp = models.CharField(max_length=300)
    instagram = models.CharField(max_length=300)
    facebook = models.CharField(max_length=300)
    logo = models.ImageField(upload_to="settings", null=True)
    s1 = models.FloatField(default=0)
    s2 = models.FloatField(default=0)
    s3 = models.FloatField(default=0)
    s4 = models.FloatField(default=0)


class profitlist(models.Model):
    date = models.DateField(default=timezone.now)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    
    currency = models.ForeignKey(currencies, on_delete=models.CASCADE, null=True)
    plan = models.ForeignKey(Plans, on_delete=models.CASCADE, null=True)
    invid = models.IntegerField(null=True, blank=True)
    amount = models.FloatField()

    def __str__(self):
        return f"{self.user}{self.invid}"


class Subjects(models.Model):
    date = models.DateField(default=timezone.now)
    lastdate = models.DateField(default=timezone.now)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    act = models.IntegerField(null=True, default=0)
    read = models.BooleanField(default=True)
    title = models.CharField(max_length=100)
    aread = models.BooleanField(default=False)


class Tickets(models.Model):
    date = models.DateField(default=timezone.now)
    subid = models.IntegerField(null=True)
    text = models.CharField(max_length=1000)
    pic = models.ImageField(upload_to="ticket", null=True)
    sender = models.IntegerField(default=0)


class pages(models.Model):
    name = models.CharField(max_length=100, unique=True)
    title = models.CharField(max_length=100)
    text = RichTextField()

    def __str__(self):
        return self.name

class Details(models.Model):
    page = models.CharField(max_length=100, unique=True)
    title = models.CharField(max_length=100)
    text = RichTextField()

    def __str__(self):
        return self.name


class Job(models.Model):
    title = models.CharField(max_length=100)
    text = models.CharField(max_length=10000)
    job = models.CharField(max_length=10000, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    username = models.CharField(max_length=100)


class Forget(models.Model):
    email = models.CharField(max_length=200, null=True)
    key = models.UUIDField(max_length=100, primary_key=True, default=uuid.uuid4)


class General(models.Model):
    title = models.CharField(max_length=300)
    banner_title = models.CharField(max_length=100)
    banner_text = models.CharField(max_length=300)


class RentedMiner(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    miner = models.ForeignKey(Miners, on_delete=models.CASCADE, null=True)
    start_date = models.DateTimeField(auto_now_add=True, editable =True)
    last_check = models.DateTimeField(auto_now=True)
    paid = models.FloatField(null=True, default = 0)
    done = models.BooleanField(default = False)

    def get_image(self):
        return self.miner.get_pic()



class Elan(models.Model):
    title = models.CharField(max_length=100)
    text = models.CharField(max_length = 1000)
    pic = models.ImageField(upload_to="blog")

    def get_image(self):
        return  ROOT + '/media/' + self.pic.name