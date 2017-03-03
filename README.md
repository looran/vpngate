vpngate
=======

vpngate.net .ovpn fetcher

### Usage

```bash
usage: vpngate [-h] <action>
actions:
    [list]
    [list] a[ll]
    r[efresh]
    f[av]
    f[av] <file.ovpn> [<file2.ovpn...]
    f[av] rm <file.ovpn> [<file2.ovpn...] | all

list     : list vpngate .ovpn files
list all : show all gates instead of best per country/protocol (last is best)
refresh  : download from vpngate.net
fav      : list favorites
fav <file.ovpn> [<file2.ovpn...]          : add one or more files to favorites
fav rm <file.ovpn> [<file2.ovpn...] | all : remove one or more files from favorites

dowloaded files are in /home/u/.vpngate/list/
favorite  files are in /home/u/.vpngate/fav/
```

### Example

```bash
$ vpngate
#/home/u/.vpngate/list1       2     3  4     5       6    7     8          9            10
#/home/u/.vpngate/listvpngate_score_ip_proto_country_ping_speed_totalusers_totaltraffic_uptime
#
/home/u/.vpngate/list/vpngate_2530_176.46.69.222_UDP_Estonia_-_0.00_137_3991.95_1906.ovpn
/home/u/.vpngate/list/vpngate_6820_206.48.228.222_TCP_Cayman Islands_-_0.00_0_0.00_0.ovpn
/home/u/.vpngate/list/vpngate_7526_148.103.247.116_TCP_Dominican Republic_-_0.00_0_13.64_64754.ovpn
/home/u/.vpngate/list/vpngate_9101_91.127.187.148_TCP_Reserved_-_0.00_0_0.00_0.ovpn
/home/u/.vpngate/list/vpngate_13941_5.76.127.237_UDP_Kazakhstan_146_1.79_24_929.53_13461660.ovpn
/home/u/.vpngate/list/vpngate_18933_94.99.130.69_TCP_Saudi Arabia_-_4.24_736_8371.31_0.ovpn
/home/u/.vpngate/list/vpngate_24281_201.213.41.140_TCP_Argentina_-_4.38_112_931.06_129.ovpn
/home/u/.vpngate/list/vpngate_31341_178.59.64.99_TCP_Cyprus_51_0.00_0_14.97_2423768.ovpn
/home/u/.vpngate/list/vpngate_36970_36.76.240.248_TCP_Indonesia_51_2.54_1542_5645.99_52693155.ovpn
/home/u/.vpngate/list/vpngate_53443_91.117.215.146_TCP_Spain_47_7.07_8244_86914.05_25219954.ovpn
/home/u/.vpngate/list/vpngate_53643_88.110.119.203_UDP_United Kingdom_36_6.33_9856_258868.82_584419646.ovpn
/home/u/.vpngate/list/vpngate_57589_186.94.21.217_UDP_Venezuela_102_1.12_71_344.71_81262085.ovpn
/home/u/.vpngate/list/vpngate_61489_41.72.118.178_TCP_Zambia_186_0.70_30_370.06_25204458.ovpn
/home/u/.vpngate/list/vpngate_62348_105.154.63.154_TCP_Morocco_139_0.84_8_29.37_29728588.ovpn
/home/u/.vpngate/list/vpngate_67784_31.215.37.246_TCP_United Arab Emirates_10_2.71_1_7.65_37634.ovpn
/home/u/.vpngate/list/vpngate_69078_89.22.254.1_TCP_Ukraine_47_11.91_4117_541835.08_10804537.ovpn
/home/u/.vpngate/list/vpngate_70069_186.93.154.206_TCP_Venezuela_136_0.74_3687_42036.98_32405584.ovpn
/home/u/.vpngate/list/vpngate_71970_99.47.249.37_UDP_United States_41_13.40_1610451_18488183.38_7287413758.ovpn
/home/u/.vpngate/list/vpngate_91647_110.159.253.172_TCP_Malaysia_9_11.18_1727_60191.63_102472924.ovpn
/home/u/.vpngate/list/vpngate_92233_46.55.254.16_TCP_Bulgaria_1_11.30_2357_101677.65_32404421.ovpn
/home/u/.vpngate/list/vpngate_93324_110.20.229.144_TCP_Australia_12_9.64_4_63.81_956555535.ovpn
/home/u/.vpngate/list/vpngate_123353_41.108.104.23_UDP_Algeria_39_0.55_4455_19452.49_28328012.ovpn
/home/u/.vpngate/list/vpngate_134057_90.157.97.78_TCP_Russian Federation_37_0.00_62_6880.20_3601310.ovpn
/home/u/.vpngate/list/vpngate_153870_106.104.41.136_TCP_Taiwan_7_32.94_149387_7970012.30_275439988.ovpn
/home/u/.vpngate/list/vpngate_156645_151.26.230.32_TCP_Italy_35_0.00_34_1128.29_18008373.ovpn
/home/u/.vpngate/list/vpngate_184307_50.49.103.154_TCP_United States_29_1.33_51845_227495.63_603185370.ovpn
/home/u/.vpngate/list/vpngate_292500_37.112.63.123_UDP_Russian Federation_10_6.86_11648_4762267.73_126016981.ovpn
/home/u/.vpngate/list/vpngate_365178_171.233.153.185_TCP_Viet Nam_36_18.81_7507_252950.48_1082785186.ovpn
/home/u/.vpngate/list/vpngate_366258_125.25.130.112_UDP_Thailand_27_17.11_1176_22530.11_15823712.ovpn
/home/u/.vpngate/list/vpngate_375310_81.198.38.10_TCP_Latvia_16_11.93_1082_66604.94_535595487.ovpn
/home/u/.vpngate/list/vpngate_380265_85.202.107.247_TCP_Poland_24_14.75_5751_263885.65_18006507.ovpn
/home/u/.vpngate/list/vpngate_389632_46.5.0.182_UDP_Germany_18_14.78_109_6459.09_27897455.ovpn
/home/u/.vpngate/list/vpngate_422815_171.96.102.111_TCP_Thailand_26_20.58_125986_9237883.67_1329562171.ovpn
/home/u/.vpngate/list/vpngate_429750_210.191.127.192_UDP_Japan_54_28.41_901_551784.77_28925707.ovpn
/home/u/.vpngate/list/vpngate_516767_211.209.220.96_TCP_Korea Republic of_31_70.81_11741_814147.40_9186472.ovpn
/home/u/.vpngate/list/vpngate_602051_114.166.57.54_TCP_Japan_12_75.40_59444_3232153.74_36920315.ovpn
```
