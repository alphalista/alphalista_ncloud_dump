# Generated by Django 5.1.1 on 2024-11-02 14:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('crawling', '0008_alter_otc_bond_expired_table'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='otc_bond_expired',
            options={'managed': False},
        ),
    ]
