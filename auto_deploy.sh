#!/bin/bash

#version : 1.0

error_usage(){
    echo "ERROR : argument not found or to mutch!" >&2
    echo "Use: $0 [options]"
    echo -e "\033[1;31m -d\033[0m ( to run whit Dockercompose ) "
    echo -e "\033[1;31m -h\033[0m ( to run whit DockerHub ) "
    exit 1
}

error_tenant(){
  echo "ERROR : argument error !" >&2
    echo "Use: $0 [options]"
    echo -e "\033[1;31m -d\033[0m ( to run whit Dockercompose ) "
    echo -e "\033[1;31m -h\033[0m ( to run whit DockerHub ) "
    exit 1
}

if [[ $# -lt 1 || $# -gt 1 ]]; then
  error_usage
fi

if [[ $1 = "-d" ]]; then
	result=1
elif [[ $1 = "-h" ]]; then
		result=2
		else
			error_tenant
fi
 
#need to creat script to install docker befor the requirements
#check if docker is present , else install 


if [[ -x $PWD/CTFd/prepare.sh ]]; then
	$PWD/CTFd/./prepare.sh

	else
		sudo apt-get update
		sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential python-dev python-pip libffi-dev
		pip install -r requirements.txt

fi

# script for the choose , run dockercompose or whit dockerhub

#script to check 
