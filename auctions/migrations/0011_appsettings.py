# Generated by Django 3.2.25 on 2024-06-24 09:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0010_delete_transactions'),
    ]

    operations = [
        migrations.CreateModel(
            name='AppSettings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('welcometitle', models.CharField(max_length=100)),
                ('welcometext', models.CharField(max_length=300)),
            ],
        ),
    ]