#!/bin/bash
if [ $EUID -ne 0 ]; then
   echo "Ezt a szkriptet csak a root futtathatja. (Tipp: hasznald a sudot)" 1>&2
   exit 1
fi
echo "
Ez a szkript csak ehhez jo: Ubuntu `printf "\e[32m16.10 Yakkety"``echo -e "\033[0m"`/`printf "\e[32m16.04 Xenial"``echo -e "\033[0m"`/`printf "\e[32m15.10 Wily"``echo -e "\033[0m"`/`printf "\e[32m14.04 Trusty"``echo -e "\033[0m"`/`printf "\e[32m12.04 Precise"``echo -e "\033[0m"` and Linux Mint `printf "\e[32m18"``echo -e "\033[0m"`/`printf "\e[32m17.x"``echo -e "\033[0m"`/`printf "\e[32m13"``echo -e "\033[0m"`
"
CHKVer=`/usr/bin/lsb_release -rs`
TVer=`/usr/bin/lsb_release -rs`
echo "OS verzio ellenorzes..."
CHKArch=`uname -m`
echo "Rendszer architektura ellenorzese"
sleep 1
echo ""
if [ $CHKVer = "16.04" ] || [ $CHKVer = "18" ] || [ $CHKVer = "16.10" ]; then
	#For Ubuntu 16.04/16.10/Linux Mint 18 64bit
	if [ $CHKArch = "x86_64" ]; then
		if [ $TVer = "16.04" ] || [ $TVer = "16.10" ]; then
		echo "Ezt futtatod: Ubuntu `printf "\e[32m16.04 +"``echo -e "\033[0m"`"
		elif [ $TVer = "18" ]; then
		echo "Ezt futtatod: Linux Mint `printf "\e[32m18"``echo -e "\033[0m"`"
		fi
		echo "Fuggosegek telepitese..."
		sleep 1
		cd /tmp/;wget -O lsb-security.deb http://de.archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb-security_4.1+Debian11ubuntu8_amd64.deb
		dpkg -i lsb-security.deb;rm lsb-security.deb
		cd /tmp/;wget -O lsb-core.deb http://de.archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb-core_4.1+Debian11ubuntu6_amd64.deb
		dpkg -i lsb-core.deb;rm lsb-core.deb;apt-get -f -y install
		echo "Google Earth letoltese a hivatalos oldalrol..."
		echo "."
		cd /tmp/;wget -O gearth64.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
		echo ".."
		dpkg -i gearth64.deb;rm gearth64.deb;cd
	#For Ubuntu 16.04/16.10/Linux Mint 18 32bit
	elif [ $CHKArch = "i686" ] || [ $CHKArch = "i586" ] || [ $CHKArch = "i386" ]; then
		if [ $TVer = "16.04" ] || [ $TVer = "16.10" ]; then
		echo "Ezt futtatod: Ubuntu `printf "\e[32m16.04 +"``echo -e "\033[0m"`"
		elif [ $TVer = "18" ]; then
		echo "Ezt futtatod: Linux Mint `printf "\e[32m18"``echo -e "\033[0m"`"
		fi
		echo "Fuggosegek telepitese..."
		sleep 1
		cd /tmp/;wget -O lsb-security.deb http://de.archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb-security_4.1+Debian11ubuntu8_i386.deb
		dpkg -i lsb-security.deb;rm lsb-security.deb
		cd /tmp/;wget -O lsb-core.deb http://de.archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb-core_4.1+Debian11ubuntu6_i386.deb
		dpkg -i lsb-core.deb;rm lsb-core.deb;apt-get -f -y install
		echo "Google Earth letoltese a hivatalos oldalrol..."
		echo "."
		cd /tmp/;wget -O gearth32.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
		echo ".."
		dpkg -i gearth32.deb;rm gearth32.deb;cd
	fi

else
	if [ $CHKArch = "x86_64" ]; then
		echo "Nem 16.04+ verziot hasznalsz, masik telepitesi mod valasztsa."
		sleep 1
		echo "Fuggosegek telepitese..."
		sleep 1
		apt-get install -y lsb-core;apt-get -f -y install
		echo "Google Earth letoltese a hivatalos oldalrol..."
		echo "."
		cd /tmp/;wget -O gearth64.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
		echo ".."
		dpkg -i gearth64.deb;rm gearth64.deb;cd
	elif [ $CHKArch = "i686" ]; then
		echo "Nem 16.04+ verziot hasznalsz, masik telepitesi mod valasztsa."
		sleep 1
		echo "Fuggosegek telepitese..."
		sleep 1
		apt-get install -y lsb-core;apt-get -f -y install
		echo "Google Earth letoltese a hivatalos oldalrol..."
		echo "."
		cd /tmp/;wget -O gearth32.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
		echo ".."
		dpkg -i gearth32.deb;rm gearth32.deb;cd
	fi
sleep 1
echo "Kilepes..."
exit 1
fi
echo ""
sleep 1
exit 1
