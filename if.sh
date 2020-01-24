#!/bin/bash
 
version=$(cat /etc/issue | cut -d "." -f1)
#version=`cat /etc/issue | cut -d "." -f1`
 
#if [ "$version" = "Linux Mint 19" ]
if [ "$version" = "Linux Mint 19" || "$version" = "Ubuntu 18" ]
then
    echo "Version is $version"
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt bionic main
EOF

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get install pritunl-client-electron -y
#pritunl-client-electron

elif [ "$version" = "Ubuntu 18" || "$version" = "Mint 18" ]
then
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt xenial main
EOF

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get install pritunl-client-electron
#pritunl-client-electron

elif [ "$version" = "Ubuntu 18" || "$version" = "Mint 18" ]
then
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt disco main
EOF

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get install pritunl-client-electron
#pritunl-client-electron
else 
    echo "Not OK"
fi
#################
####################
#fi
####################
#lsb_release -a | grep -i disco
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
