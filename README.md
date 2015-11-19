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
refresh  : refresh from vpngate.net
fav      : list favorites
fav <file.ovpn> [<file2.ovpn...]          : add one or more files to favorites
fav rm <file.ovpn> [<file2.ovpn...] | all : remove one or more files from favorites

.ovpn files are named after "vpngate_SCORE_IP_PROTO_COUNTRY.ovpn"
refreshed files are in /home/u/.vpngate/list/
favorite  files are in /home/u/.vpngate/fav/

```

### Example

```bash
$ vpngate
/home/u/.vpngate/list/vpngate_14000_112.210.115.144_TCP_Philippines.ovpn
/home/u/.vpngate/list/vpngate_19571_85.154.50.179_TCP_Oman.ovpn
/home/u/.vpngate/list/vpngate_21945_197.251.135.235_TCP_Ghana.ovpn
/home/u/.vpngate/list/vpngate_29929_41.237.227.20_UDP_Egypt.ovpn
/home/u/.vpngate/list/vpngate_36381_109.229.34.88_TCP_Czech Republic.ovpn
/home/u/.vpngate/list/vpngate_38481_109.156.92.234_TCP_United Kingdom.ovpn
/home/u/.vpngate/list/vpngate_62382_93.148.63.110_TCP_Italy.ovpn
/home/u/.vpngate/list/vpngate_63942_178.141.81.244_TCP_Russian Federation.ovpn
/home/u/.vpngate/list/vpngate_79733_175.136.174.87_TCP_Malaysia.ovpn
/home/u/.vpngate/list/vpngate_81400_52.17.132.174_TCP_United States.ovpn
/home/u/.vpngate/list/vpngate_84436_36.74.34.230_UDP_Indonesia.ovpn
/home/u/.vpngate/list/vpngate_85981_37.187.34.158_TCP_France.ovpn
/home/u/.vpngate/list/vpngate_111918_106.0.176.61_TCP_Thailand.ovpn
/home/u/.vpngate/list/vpngate_124837_41.109.219.78_UDP_Algeria.ovpn
/home/u/.vpngate/list/vpngate_138087_62.38.153.75_UDP_Greece.ovpn
/home/u/.vpngate/list/vpngate_148136_190.38.202.191_TCP_Venezuela.ovpn
/home/u/.vpngate/list/vpngate_160639_5.246.101.78_TCP_Saudi Arabia.ovpn
/home/u/.vpngate/list/vpngate_166451_193.107.85.47_TCP_Iceland.ovpn
/home/u/.vpngate/list/vpngate_191225_87.222.15.214_UDP_Spain.ovpn
/home/u/.vpngate/list/vpngate_202119_110.12.132.52_UDP_Korea Republic of.ovpn
/home/u/.vpngate/list/vpngate_210137_223.205.194.209_UDP_Thailand.ovpn
/home/u/.vpngate/list/vpngate_212985_50.166.199.133_UDP_United States.ovpn
/home/u/.vpngate/list/vpngate_231031_42.112.243.176_TCP_Viet Nam.ovpn
/home/u/.vpngate/list/vpngate_236774_200.19.200.175_TCP_Brazil.ovpn
/home/u/.vpngate/list/vpngate_264473_93.229.11.150_UDP_Germany.ovpn
/home/u/.vpngate/list/vpngate_282798_190.213.167.174_TCP_Trinidad and Tobago.ovpn
/home/u/.vpngate/list/vpngate_291267_1.160.22.63_TCP_Taiwan.ovpn
/home/u/.vpngate/list/vpngate_301956_37.228.239.252_UDP_Austria.ovpn
/home/u/.vpngate/list/vpngate_409828_113.160.16.206_UDP_Viet Nam.ovpn
/home/u/.vpngate/list/vpngate_494359_113.252.156.121_TCP_Hong Kong.ovpn
/home/u/.vpngate/list/vpngate_512833_39.115.128.147_TCP_Korea Republic of.ovpn
/home/u/.vpngate/list/vpngate_576621_126.218.178.206_UDP_Japan.ovpn
/home/u/.vpngate/list/vpngate_603055_121.95.109.128_TCP_Japan.ovpn
```
