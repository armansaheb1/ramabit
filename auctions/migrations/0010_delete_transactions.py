# Generated by Django 3.2.25 on 2024-06-15 21:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0009_transaction'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Transactions',
        ),
    ]