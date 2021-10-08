#!/bin/bash


if [ "$EUID" -ne 0 ]
	then echo "Please run as root/sudo"
	exit
fi


for container in $(docker ps | grep saml-practice | cut -d " " -f 1); do docker stop $container; done
