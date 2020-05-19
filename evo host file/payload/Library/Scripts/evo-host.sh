#!/bin/bash

ETC_HOSTS=/etc/hosts

SUBNET=192.168.40
IP=192.168.40.2
HOSTNAME=EVO

#--------

removehost() {
    echo "removing host";
    if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
    then
        echo "$HOSTNAME Found in your $ETC_HOSTS, Removing now...";
        sudo sed -i".bak" "/$HOSTNAME/d" $ETC_HOSTS
    else
        echo "$HOSTNAME was not found in your $ETC_HOSTS";
    fi
}

addhost() {
    echo "adding host";
    HOSTS_LINE="$IP\t$HOSTNAME"
    if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
        then
            echo "$HOSTNAME already exists : $(grep $HOSTNAME $ETC_HOSTS)"
        else
            echo "Adding $HOSTNAME to your $ETC_HOSTS";
            sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";

            if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
                then
                    echo "$HOSTNAME was added succesfully \n $(grep $HOSTNAME /etc/hosts)";
                else
                    echo "Failed to Add $HOSTNAME, Try again!";
            fi
    fi
}

subnetCheck=$(ifconfig | grep $SUBNET)

if [[ -z $subnetCheck || $subnetCheck == "" ]]; then
  # not on edit network - remove host entry if present
  removehost
else
  # on edit network - make sure host entry is present
  addhost
fi

exit 0
