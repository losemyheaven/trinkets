#!/bin/bash

#sle 15 on ha-2
no=$1
#((no -- ))
echo $no
host_list=(10.67.162.152
	10.67.162.66)
host=${host_list[$no]}
if [ -z $host ]
then
	echo invalid host
fi
echo $host
user=root
passwd=suse
known_hosts="$HOME/.ssh/known_hosts"

if [ -z "$(grep $host ${known_hosts})" ]
then
	echo not known
	ssh -X ${user}@${host}
else
	sshpass -p $passwd ssh -X $user@$host
fi
