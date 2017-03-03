#!/bin/sh

# vpngate.net .ovpn fetcher
# 2015, 2017, Laurent Ghigonis <laurent@gouloum.fr>

PROG=$(basename $0)
OUT=$HOME/.vpngate
LIST=$OUT/list
LISTFILE=$OUT/list.txt
FAV=$OUT/fav
mkdir -p $OUT $LIST $FAV

# HELPERS

helpexit() {
	cat <<-_EOF
	usage: $PROG [-h] <action>
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

	dowloaded files are in $LIST/
	favorite  files are in $FAV/
	_EOF
	exit
}

# ACTIONS

do_refresh() {
	wget -O $LISTFILE "http://www.vpngate.net/api/iphone/" ||exit
	rm $LIST/vpngate_*
	tail -n+3 $LISTFILE |head -n-1 |while read s; do
		ip=$(echo $s |cut -d',' -f2)
		score=$(echo $s |cut -d',' -f3)
		ping=$(echo $s |cut -d',' -f4)
		speed=$(printf "%.2f\n" $(bc -l <<< "$(echo $s |cut -d',' -f5) / 1000000"))
		country=$(echo $s |cut -d',' -f6)
		sessions=$(echo $s |cut -d',' -f8)
		uptime=$(echo $s |cut -d',' -f9)
		totalusers=$(echo $s |cut -d',' -f10)
		totaltraffic=$(printf "%.2f\n" $(bc -l <<< "$(echo $s |cut -d',' -f11) / 1000000"))
		echo $s |cut -d',' -f15 |head -n6 |tail -n1 |base64 -d > $LIST/tmp 2>/dev/null
		proto="$(echo $(egrep "^proto tcp" $LIST/tmp ||echo "proto udp") |cut -d' ' -f2 |tr -d '\r' |tr '[a-z]' '[A-Z]')"
		mv $LIST/tmp "$LIST/vpngate_${score}_${ip}_${proto}_${country}_${ping}_${speed}_${totalusers}_${totaltraffic}_${uptime}.ovpn"
	done
}
do_list() {
	echo "#${LIST}1       2     3  4     5       6    7     8          9            10"
	echo "#${LIST}vpngate_score_ip_proto_country_ping_speed_totalusers_totaltraffic_uptime"
	echo "#"
	find $LIST -name "vpngate_*" |sort -n -t'_' -k2 -r |sort -t'_' -k4,5 -u |sort -n -t'_' -k2
	do_fav_list
}
do_list_all() {
	echo "#${LIST}1       2     3  4     5       6    7     8          9            10"
	echo "#${LIST}vpngate_score_ip_proto_country_ping_speed_totalusers_totaltraffic_uptime"
	echo "#"
	find $LIST -name "vpngate_*" |sort -n -t'_' -k2
	do_fav_list
}
do_fav_list() {
	find $FAV |tail -n+2
}
do_fav_add() {
	for f in "$@"; do
		cp $f $FAV/
	done
}
do_fav_rm() {
	if [ X"$1" = X"all" ]; then
		rm $FAV/*
	else
		for f in "$@"; do
			rm $FAV/$(basename $f)
		done
	fi
}

# MAIN

[ ! -e $LISTFILE ] && do_refresh

case $1 in
a|all)
	[ ! -e $LISTFILE ] && do_refresh
	do_list_all
	;;
r|refresh)
	do_refresh
	do_list
	;;
f|fav)
	if [ $# -eq 1 ]; then
		do_fav_list
	else
		if [ X"$2" = X"rm" ]; then
			shift; shift
			do_fav_rm $@
		else
			shift
			do_fav_add $@
		fi
	fi
	;;
""|l|list)
	[ ! -e $LISTFILE ] && do_refresh
	if [ X"$2" = X"a" -o X"$2" = X"all" ]; then
		do_list_all
	else
		do_list
	fi
	;;
*)
	helpexit
esac
