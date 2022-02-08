#!/bin/zsh
cd ~/Downloads/

PZB="/usr/local/bin/pzb"
URL=$1 #"https://updates.cdn-apple.com/2022WinterSeed/fullrestores/002-44635/54B0513B-EC2D-426B-961D-8E3266957FCB/iPhone14,2_15.3_19D5026g_Restore.ipsw"
DEVICE=$2

if [[ $# -eq 0 ]] ; then
	echo "[?] Usage: <URL> <DEVICE_MODEL>"
	exit 1
fi

IPSW=`echo $URL | tr '/' '\n' | tail -1 | sed -e 's/Restore.ipsw/kern/g'`
KERNCACHE=`${PZB} -l $URL | grep "kernelcache*" | tr ' ' '\n' | tail -1`

OUTPUT="${IPSW}_${DEVICE}"
${PZB} ${URL} -g ${KERNCACHE} -o ${OUTPUT}
echo '[+] DONE'
