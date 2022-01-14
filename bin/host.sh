#!/usr/bin/env bash

echo -------------------------------------------------------------------------
echo  ======  Host Manger for My Mac. notice below:
echo  You must do this "sudo cp /etc/hosts /etc/host-my.bak" before start shell
echo  You can input: "sudo host.sh my" or "sudo host.sh git"
echo -------------------------------------------------------------------------

#sudo cp /etc/hosts /etc/host-my.bak

case $1 in
	my)
		sudo rm -rf /etc/hosts
		sudo cp /etc/hosts-my.bak /etc/hosts
		echo Success for my.
		;;
	git)
		wget https://raw.githubusercontent.com/racaljk/hosts/master/hosts -O fetchedhosts
		sed -i "s/localhost/localhost $(hostname)/g" fetchedhosts
		sed -i "s/broadcasthost/broadcasthost $(hostname)/g" fetchedhosts
		sudo rm -rf /etc/hosts
		sudo mv fetchedhosts /etc/hosts
		echo Success for git.
		;;
esac

exit
0
