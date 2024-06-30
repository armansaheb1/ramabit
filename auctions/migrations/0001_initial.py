# Generated by Django 3.2.25 on 2024-05-21 07:55

import ckeditor.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('ref', models.CharField(default=uuid.uuid4, max_length=100, unique=True, verbose_name='REF')),
                ('username', models.CharField(max_length=100, null=True, unique=True)),
                ('inv', models.CharField(max_length=100, null=True)),
                ('name', models.CharField(max_length=100, null=True, verbose_name='نام')),
                ('lastname', models.CharField(max_length=100, null=True, verbose_name='نام خانوادگی')),
                ('mobile', models.CharField(max_length=100, null=True, verbose_name='موبایل')),
                ('is_active', models.BooleanField(default=True)),
                ('is_verified', models.BooleanField(default=False)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='act',
            fields=[
                ('aucid', models.IntegerField(auto_created=True, primary_key=True, serialize=False)),
                ('act', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('pic', models.ImageField(upload_to='blog')),
            ],
        ),
        migrations.CreateModel(
            name='bazdid',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('count', models.IntegerField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='blog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('title', models.CharField(max_length=100)),
                ('text', models.CharField(max_length=10000)),
                ('pic', models.ImageField(upload_to='blog')),
            ],
        ),
        migrations.CreateModel(
            name='Cat',
            fields=[
                ('name', models.CharField(max_length=100, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='currencies',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name=' نام ارز')),
                ('brand', models.CharField(max_length=100, null=True, verbose_name=' نماد ارز')),
                ('pic', models.ImageField(null=True, upload_to='cur')),
                ('qr', models.ImageField(null=True, upload_to='cur')),
                ('address', models.CharField(max_length=1000, null=True)),
                ('price', models.FloatField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Details',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('page', models.CharField(max_length=100, unique=True)),
                ('title', models.CharField(max_length=100)),
                ('text', ckeditor.fields.RichTextField()),
            ],
        ),
        migrations.CreateModel(
            name='Elan',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('text', models.CharField(max_length=1000)),
                ('pic', models.ImageField(upload_to='blog')),
            ],
        ),
        migrations.CreateModel(
            name='Forget',
            fields=[
                ('email', models.CharField(max_length=200, null=True)),
                ('key', models.UUIDField(default=uuid.uuid4, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='General',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=300)),
                ('banner_title', models.CharField(max_length=100)),
                ('banner_text', models.CharField(max_length=300)),
            ],
        ),
        migrations.CreateModel(
            name='Miners',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('pic', models.ImageField(upload_to='miner')),
                ('des', models.TextField(max_length=10000)),
                ('rate', models.FloatField(null=True)),
                ('period', models.CharField(max_length=100, null=True)),
                ('price', models.FloatField(default=0)),
                ('profit', models.FloatField(default=0)),
                ('currency', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='auctions.currencies')),
            ],
        ),
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('title', models.CharField(max_length=100)),
                ('text', models.CharField(max_length=10000)),
                ('pic', models.ImageField(upload_to='blog')),
                ('place', models.CharField(default='normal', max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='pages',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('title', models.CharField(max_length=100)),
                ('text', ckeditor.fields.RichTextField()),
            ],
        ),
        migrations.CreateModel(
            name='Plans',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('des', models.TextField(max_length=10000)),
                ('percent', models.FloatField(null=True)),
                ('mini', models.FloatField(null=True)),
                ('maxi', models.FloatField(null=True)),
                ('period', models.CharField(max_length=100, null=True)),
                ('currency', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.currencies')),
            ],
        ),
        migrations.CreateModel(
            name='post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('title', models.CharField(max_length=100)),
                ('text', models.CharField(max_length=10000)),
                ('pic', models.ImageField(upload_to='blog')),
                ('place', models.CharField(default='normal', max_length=100)),
                ('app', models.BooleanField(default=False)),
                ('index', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('pic', models.ImageField(upload_to='miner')),
                ('des', models.TextField(max_length=10000)),
                ('price', models.FloatField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='ProductOrder',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firs_name', models.CharField(max_length=100)),
                ('last_name', models.ImageField(upload_to='products')),
                ('address', models.TextField(max_length=10000)),
                ('postal_code', models.TextField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='settings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('address', models.CharField(max_length=300)),
                ('tel', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=100)),
                ('telegram', models.CharField(max_length=300)),
                ('whatsapp', models.CharField(max_length=300)),
                ('instagram', models.CharField(max_length=300)),
                ('facebook', models.CharField(max_length=300)),
                ('logo', models.ImageField(null=True, upload_to='settings')),
                ('s1', models.FloatField(default=0)),
                ('s2', models.FloatField(default=0)),
                ('s3', models.FloatField(default=0)),
                ('s4', models.FloatField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Tickets',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('subid', models.IntegerField(null=True)),
                ('text', models.CharField(max_length=1000)),
                ('pic', models.ImageField(null=True, upload_to='ticket')),
                ('sender', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='wallet',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.FloatField(default=0)),
                ('currency', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.currencies')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Verify',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mobilev', models.BooleanField(default=False, null=True)),
                ('mobilec', models.IntegerField(null=True)),
                ('emailv', models.BooleanField(default=False, null=True)),
                ('emailc', models.IntegerField(null=True)),
                ('melliv', models.IntegerField(default=0, null=True)),
                ('bankv', models.IntegerField(default=0, null=True)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Transactions',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('amount', models.FloatField()),
                ('act', models.IntegerField(null=True)),
                ('currency', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.currencies')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Subjects',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('lastdate', models.DateField(default=django.utils.timezone.now)),
                ('act', models.IntegerField(default=0, null=True)),
                ('read', models.BooleanField(default=True)),
                ('title', models.CharField(max_length=100)),
                ('aread', models.BooleanField(default=False)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='RentedMiner',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_date', models.DateTimeField(auto_now_add=True)),
                ('last_check', models.DateTimeField(auto_now=True)),
                ('paid', models.FloatField(default=0, null=True)),
                ('done', models.BooleanField(default=False)),
                ('miner', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.miners')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='profitlist',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now)),
                ('invid', models.IntegerField(blank=True, null=True)),
                ('amount', models.FloatField()),
                ('currency', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.currencies')),
                ('plan', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.plans')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Job',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('text', models.CharField(max_length=10000)),
                ('job', models.CharField(max_length=10000, null=True)),
                ('username', models.CharField(max_length=100)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='bid',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('deposit', models.FloatField()),
                ('option', models.CharField(max_length=100, null=True)),
                ('date_field', models.DateField(default=django.utils.timezone.now)),
                ('plan', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.plans')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Askamountreq',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.FloatField()),
                ('link', models.CharField(max_length=1000, null=True)),
                ('currency', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.currencies')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Adminverifymelli',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('melliimg', models.ImageField(null=True, upload_to='melli')),
                ('mellic', models.IntegerField(null=True)),
                ('action', models.BooleanField(default=False)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Adminverifybank',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bankimg', models.ImageField(null=True, upload_to='bank')),
                ('bankc', models.IntegerField(null=True)),
                ('action', models.BooleanField(default=False)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Addamountreq',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.FloatField()),
                ('link', models.CharField(max_length=1000, null=True)),
                ('currency', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.currencies')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
