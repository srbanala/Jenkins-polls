# Generated by Django 2.0.7 on 2020-08-22 17:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mortgage', '0006_auto_20200822_1346'),
    ]

    operations = [
        migrations.AlterField(
            model_name='monthly_expenses',
            name='price',
            field=models.FloatField(),
        ),
    ]
