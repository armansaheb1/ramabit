# Generated by Django 3.2.25 on 2024-05-27 12:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chat', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='chatuser',
            name='email',
            field=models.EmailField(max_length=100, null=True),
        ),
    ]
