# Generated by Django 3.2.25 on 2024-06-15 20:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0004_alter_transactions_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transactions',
            name='id',
            field=models.CharField(default='a5f2d46d-2', editable=False, max_length=10, primary_key=True, serialize=False),
        ),
    ]