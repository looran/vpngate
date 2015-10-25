#!/bin/sh

# vpngate.net .ovpn fetcher
# 2015, Laurent Ghigonis <laurent@gouloum.fr>

OUT=$HOME/.vpngate
LIST=$OUT/list.txt
mkdir -p $OUT

if [ X"$1" = X"-h" ]; then
	cat <<-_EOF
	usage: $(basename $0) [-arh]
	-a : show all gates instead of best per country/protocol (last is best)
	-r : refresh from vpngate.net

	.ovpn files are stored in ~/.vpngate/vpngate_SCORE_IP_PROTO_COUNTRY.ovpn
	_EOF
	exit
fi

if [ ! -e $LIST -o X"$1" = X"-r" ]; then
	wget -O $LIST "http://www.vpngate.net/api/iphone/" ||exit
	rm $OUT/vpngate_*
	tail -n+3 $LIST |head -n-1 |while read s; do
		ip=$(echo $s |cut -d',' -f2)
		score=$(echo $s |cut -d',' -f3)
		country=$(echo $s |cut -d',' -f6)
		echo $s |cut -d',' -f15 |head -n6 |tail -n1 |base64 -d > $OUT/tmp 2>/dev/null
		proto="$(echo $(egrep "^proto tcp" $OUT/tmp ||echo "proto udp") |cut -d' ' -f2 |tr -d '\r' |tr '[a-z]' '[A-Z]')"
		mv $OUT/tmp "$OUT/vpngate_${score}_${ip}_${proto}_${country}.ovpn"
	done
fi

if [ X"$1" = X"-a" ]; then
	find $OUT |sort -n -t'_' -k2
else
	find $OUT |sort -n -t'_' -k2 -r |sort -t'_' -k4,5 -u |sort -n -t'_' -k2
fi
