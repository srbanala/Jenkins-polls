# Generated by Django 2.0.7 on 2020-08-25 16:12

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('mortgage', '0008_auto_20200824_2241'),
    ]

    operations = [
        migrations.AddField(
            model_name='monthly_expenses',
            name='pub_date',
            field=models.DateField(default=datetime.datetime(2020, 8, 25, 16, 12, 16, 835852, tzinfo=utc)),
        ),
        migrations.AlterField(
            model_name='monthly_payment',
            name='interest',
            field=models.DecimalField(decimal_places=3, max_digits=5),
        ),
        migrations.AlterField(
            model_name='remaining_balance',
            name='amount_due',
            field=models.FloatField(),
        ),
    ]
