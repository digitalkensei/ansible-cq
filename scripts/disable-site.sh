#!/bin/bash
#based on http://www.tecmint.com/shell-in-a-box-a-web-based-ssh-terminal-to-access-remote-linux-servers/
avail=/etc/httpd/sites-enabled/$1.conf
enabled=/etc/httpd/sites-enabled
site=`ls /etc/httpd/sites-enabled/`
if [ "$#" != "1" ]; then
				echo "Use script: disable-site virtual_site"
				echo -e "\nAvailable virtual hosts:\n$site"
				exit 0
else
if test -e $avail; then
rm $avail
else
echo -e "$avail virtual host does not exist!
Exiting!"
exit 0
fi
if test -e $enabled/$1.conf; then
echo "Error!! Could not remove $avail virtualhost!"
else
echo -e "Success! $avail has been removed!\nApache has been restarted!"
sudo /etc/init.d/httpd restart
exit 0
fi
fi