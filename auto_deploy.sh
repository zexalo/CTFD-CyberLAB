#!/bin/bash

version=1.4

error_usage(){
    echo "ERROR : argument not found or to mutch!" >&2
    echo "Use: $0 [options]"
    echo -e "\033[1;31m -d\033[0m ( to run whit Dockercompose ) "
    echo -e "\033[1;31m -h\033[0m ( to run whit DockerHub ) "
    echo -e "\033[1;31m -v\033[0m ( Show version ) "
    exit 1
}

error_tenant(){
  echo "ERROR : argument error !" >&2
    echo "Use: $0 [options]"
    echo -e "\033[1;31m -d\033[0m ( to run whit Dockercompose ) "
    echo -e "\033[1;31m -h\033[0m ( to run whit DockerHub ) "
    echo -e "\033[1;31m -v\033[0m ( Show version ) "
    exit 1
}

if [[ $# -lt 1 || $# -gt 1 ]]; then
  error_usage
fi

if [[ "$1" == "-d" ]]; then
	result=1
elif [[ "$1" == "-h" ]]; then
		result=2
    elif [[ "$1" == "-v" ]]; then
            echo " $0  |  Version : $version "
            exit
		else
			error_tenant
fi

which docker 
itis=$?
#echo "$sult"
if [[ "$itis" ]]; then
    #add repo dokcer ?
    sudo apt update
    sudo apt install docker-ce
fi

#check befor ? 

if [[ -x $PWD/CTFd/prepare.sh ]]; then
    cd $PWD/CTFd/
	./prepare.sh
    deg=$?
    #echo "$deg"        
	else
        sudo chmod 755 $PWD/CTFd/prepare.sh
        cd $PWD/CTFd/
        ./prepare.sh
        deg=$?
        #echo "$deg"
            fi
        if [[ "$deg" ]]; then
        #cd $PWD/CTFd/
        sudo apt-get update
        sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential python-dev python-pip libffi-dev
        pip install -r requirements.txt

        fi

if [[ "$result" == "1" ]]; then
    #statement
fi


# script for the choose , run dockercompose or whit dockerhub

#script to check 
