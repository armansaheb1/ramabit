# Generated by Django 3.1.7 on 2021-04-01 14:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0061_profitlist_curid'),
    ]

    operations = [
        migrations.CreateModel(
            name='Askamountreq',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('curid', models.IntegerField()),
                ('userid', models.IntegerField()),
                ('amount', models.FloatField()),
                ('link', models.CharField(max_length=1000, null=True)),
            ],
        ),
    ]
