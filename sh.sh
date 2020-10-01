#!/bin/bash

source /etc/profile
curl https://download.db-ip.com/free/dbip-country-lite-$(date +'%Y-%m').mmdb.gz -o dbip-country-lite.mmdb.gz
curl https://download.db-ip.com/free/dbip-country-lite-$(date +'%Y-%m').csv.gz -o dbip-country-lite.csv.gz
curl https://raw.githubusercontent.com/torproject/tor/master/src/config/mmdb-convert.py -o mmdb-convert.py
gunzip dbip-country-lite*.gz
mkdir -p xt_geoip
python mmdb-convert.py dbip-country-lite.mmdb>/dev/null 2>&1
chmod +x xt_geoip_build
./xt_geoip_build -D xt_geoip *.csv
rm -f dbip-* mmdb-convert.py
