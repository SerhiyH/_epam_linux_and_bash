#!/bin/bash
# Task 1., subtask A.: script should:
# 1.When starting without parameters, it will display a list of possible keys and their description.
# 2.The --all key displays the IP addresses and symbolic names of all hosts in the current subnet.
# 3.The --target key displays a list of open system TCP ports.
# The code that performs the functionality of the subtasks must be placed in a separate function.


if [ "$1" = "" ]; then
  echo -e "===> You can choose \"--all\" or \"--target\" keys. <==="
  echo -e "===> The --all key displays the IP addresses and symbolic names of all hosts in the current subnet. <==="
  echo -e "===> The --target key displays a list of open system TCP ports. <==="
  echo
fi

#choosing parameters / keys
read key

net=`ip a`
key_all="--all"
ip_address

function all_func {
if [ "$key" = "$key_all" ]; then
  echo
  echo -e "$net"
  echo -e "\nChoose an IP-address's subnets (e.g 192.168.1.0/24): "
  echo
  read ip_address
  echo
  nmap -sn $ip_address
fi
}
all_func

tar=`ss -tulnp | grep tcp`
key_tar="--target"

function key_tar {
if [ "$key" = "$key_tar" ]; then
  echo
  echo -e "$tar"
  echo
fi
}
key_tar

function wrong_key {
if [ "$key" !=  "$key_all" ] && [ "$key" != "$key_tar"  ]; then
  echo
  echo "===> Something is wrong <==="
  echo "------------------------------------"
  echo "===> Please choose one for keys <==="
  echo
fi
}
wrong_key