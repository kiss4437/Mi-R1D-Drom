#!/bin/sh
rm -f $0
mount -o remount rw /

clear
echo "#############################################################"
echo "# Install Drcom for Miwifi_R1d"
echo "#############################################################"

# Config Mifi_R1d init script
if [ -f "/etc/init.d/drcom" ]; then
	rm -f /etc/init.d/drcom
fi
curl -o /etc/init.d/drcom https://github.com/kiss4437/Mi-R1D-Drom/raw/master/drcom_init.d
chmod +x /etc/init.d/drcom
ln -s /etc/init.d/drcom /bin/drcom

#config Drcom
if [ ! -d "/usr/Drcom" ]; then
  mkdir -p /usr/Drcom
fi
rm -rf /usr/Drcom/*
curl -o /usr/Drcom/drcom  https://github.com/kiss4437/Mi-R1D-Drom/raw/master/drcom
curl -o /usr/Drcom/drcom.conf  https://github.com/kiss4437/Mi-R1D-Drom/raw/master/drcom.conf
chmod +x /usr/Drcom/drcom
chmod +x /usr/Drcom/drcom.conf

#restart all service
/etc/init.d/drcom start
/etc/init.d/drcom enable

#install successfully
ps | grep drcom | grep -v grep
if [ $? -ne 0 ]
then
echo ""
echo "Drcom安装失败....！"
echo ""
else
echo ""
echo "Drcom安装成功！"
echo ""
fi
exit 0
