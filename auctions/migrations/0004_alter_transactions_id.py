# Generated by Django 3.2.25 on 2024-05-25 06:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0003_alter_transactions_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transactions',
            name='id',
            field=models.CharField(default='de368398-2', editable=False, max_length=10, primary_key=True, serialize=False, unique=True),
        ),
    ]
