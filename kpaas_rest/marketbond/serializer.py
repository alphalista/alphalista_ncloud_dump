from rest_framework import serializers

from .models import (
    MarketBond,
    MarketBondCode,
    MarketBondIssueInfo,
    MarketBondSearchInfo,
    MarketBondInquireAskingPrice,
    MarketBondAvgUnit,
    MarketBondInquireDailyItemChartPrice,
    MarketBondInquirePrice,
    MarketBondInquireCCNL,
    MarketBondInquireDailyPrice,
)


class MarketBondCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = MarketBondCode
        fields = "__all__"


class MarketBondIssueInfoSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondIssueInfo
        fields = "__all__"


class MarketBondSearchInfoSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondSearchInfo
        fields = "__all__"


class MarketBondInquireAskingPriceSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondInquireAskingPrice
        fields = "__all__"


class MarketBondAvgUnitSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondAvgUnit
        fields = "__all__"


class MarketBondInquireDailyItemChartPriceSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondInquireDailyItemChartPrice
        fields = "__all__"


class MarketBondInquirePriceSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondInquirePrice
        fields = "__all__"


class MarketBondInquireCCNLSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondInquireCCNL
        fields = "__all__"


class MarketBondInquireDailyPriceSerializer(serializers.ModelSerializer):
    code = serializers.PrimaryKeyRelatedField(queryset=MarketBondCode.objects.all())

    class Meta:
        model = MarketBondInquireDailyPrice
        fields = "__all__"

class MarketBondSerializer(serializers.ModelSerializer):
    issue_info_data = MarketBondIssueInfoSerializer(read_only=True)
    inquire_price_data = MarketBondInquirePriceSerializer(read_only=True)
    class Meta:
        model = MarketBond
        fields = [
            'code',
            'pdno',
            'prdt_type_cd',
            'prdt_name',
            'bond_clsf_kor_name',
            'int_dfrm_mcnt',
            'bond_int_dfrm_mthd_cd',
            'prca_dfmt_term_mcnt',
            'issu_istt_name',
            'srfc_inrt',
            'expd_asrc_erng_rt',
            'int_dfrm_day_type_cd',
            'issu_dt',
            'expd_dt',
            'nxtm_int_dfrm_dt',
            'nice_crdt_grad_text',
            'bond_prpr',
        ]