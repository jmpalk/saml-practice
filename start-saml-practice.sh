#!/bin/bash


if [ "$EUID" -ne 0 ]
	then echo "Please run as root/sudo"
	exit
fi

echo "Please enter your host's ip address: "

read ip

FILE="Dockerfile.idp"
if test -f "$FILE"; then
	rm $FILE
fi

cat Dockerfile.idp.orig | sed "s/AAABBBCCCDDD/$ip/g" > Dockerfile.idp
docker build -t saml-practice-idp -f Dockerfile.idp .

FILE="Dockerfile.sp"
if test -f "$FILE"; then
	rm $FILE
fi

cat Dockerfile.sp.orig | sed "s/AAABBBCCCDDD/$ip/g" > Dockerfile.sp
docker build -t saml-practice-sp -f Dockerfile.sp .

FILE="Dockerfile.sp2"
if test -f "$FILE"; then
	rm $FILE
fi

cat Dockerfile.sp2.orig | sed "s/AAABBBCCCDDD/$ip/g" > Dockerfile.sp2
docker build -t saml-practice-sp2 -f Dockerfile.sp2 .


docker run -d -p 8000:8000 saml-practice-idp
docker run -d -p 9001:9001 saml-practice-sp
docker run -d -p 9000:9000 saml-practice-sp2
