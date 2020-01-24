#!/bin/bash
 
## Get linux version to run specfic scripts against it.
version=$(cat /etc/issue | cut -d "." -f1)
 
if [ "$version" = "Linux Mint 19" || "$version" = "Ubuntu 18" ]
then
    	echo "Version is $version"
	sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
	deb http://repo.pritunl.com/stable/apt bionic main
	EOF

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
	sudo apt-get update
	sudo apt-get install pritunl-client-electron -y

elif [ "$version" = "Linux Mint 18" || "$version" = "Ubuntu 16" ]
then
	sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
	deb http://repo.pritunl.com/stable/apt xenial main
	EOF

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
	sudo apt-get update
	sudo apt-get install pritunl-client-electron

elif [ "$version" = "Ubuntu 19" ]
then
	sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
	deb http://repo.pritunl.com/stable/apt disco main
	EOF

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
	sudo apt-get update
	sudo apt-get install pritunl-client-electron
else 
    	echo "$version not supported by this script, only Ubuntu 16, Ubuntu 18, Linux Mint 18 and Linux Mint 19 are supported!!"
fi
exit
#################
####################
#fi
####################
#lsb_release -a | grep -i disco
#### Create desktop icon and launcher to desktop
tee /home/$USER/Desktop/Pritunl.desktop << EOF
[Desktop Entry]
Name=Pritunl Client
Comment=Pritunl openvpn client
Exec=/usr/lib/pritunl_client_electron/Pritunl
Terminal=false
Type=Application
StartupNotify=false
Icon=pritunl_client_electron
Categories=Network;TrayIcon;
StartupWMClass=pritunl
EOF
chmod +x /home/$USER/Desktop/Pritunl.desktop
## Start the Pritunl client
pritunl-client-electron
