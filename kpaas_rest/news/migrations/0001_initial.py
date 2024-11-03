# Generated by Django 5.1.1 on 2024-10-17 15:05

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="SearchKeyword",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "search_keyword",
                    models.CharField(max_length=200, verbose_name="검색 키워드"),
                ),
            ],
        ),
        migrations.CreateModel(
            name="NaverNews",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("title", models.CharField(max_length=200, verbose_name="제목")),
                (
                    "originallink",
                    models.CharField(max_length=200, verbose_name="원본 링크"),
                ),
                ("link", models.CharField(max_length=200, verbose_name="링크")),
                ("description", models.TextField(verbose_name="요약")),
                ("pubDate", models.CharField(max_length=200, verbose_name="발행 일자")),
                (
                    "search_keyword",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="news.searchkeyword",
                    ),
                ),
            ],
            options={
                "constraints": [
                    models.UniqueConstraint(
                        fields=("originallink",), name="unique_naver_news"
                    )
                ],
            },
        ),
    ]
