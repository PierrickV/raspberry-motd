#!/bin/sh

#Here is the path to your motd file
motd_file="/etc/motd"

#Define color to use

Black='\033[0;30m'
DarkGray='\033[1;30m'
Red='\033[0;31m'
LightRed='\033[1;31m'
Green='\033[0;32m'
LightGreen='\033[1;32m'
BrownOrange='\033[0;33m'
Yellow='\033[1;33m'
Blue='\033[0;34m'
LightBlue='\033[1;34m'
Purple='\033[0;35m'
LightPurple='\033[1;35m'
Cyan='\033[0;36m'
LightCyan='\033[1;36m'
LightGray='\033[0;37m'
White='\033[1;37m'
NC='\033[0m' # No Color

# Ex: printf "I ${Red}love${NC} Stack ${Green}Overflow${NC}\n"

#Commandes lines
#ip_lan=$(ip addr show scope global | grep inet | cut -d' ' -f6 | cut -d/ -f1)
ip_pub=$(curl -sS http://ifconfig.co)
up=$(uptime | awk -F"up " '{print $2}' | awk -F"," '{print $1}')
mem_used=$(df -h | grep 'dev/root' | awk '{print $3}')
mem_available=$(df -h | grep 'dev/root' | awk '{print $4}')
debian_version=$(cat /etc/debian_version)
kernel_version=$(uname --machine --operating-system --kernel-release)
hostname=$(hostname -f)

printf "
${Green}      .~~.   .~~.
${Green}     '. \ ' ' / .'
${Red}      .~ .~~~..~.          ${Green}                  _                          _
${Red}     : .~.'~'.~. :         ${Green}  ___ ___ ___ ___| |_ ___ ___ ___ _ _    ___|_|
${Red}    ~ (   ) (   ) ~        ${Green} |  _| .'|_ -| . | . | -_|  _|  _| | |  | . | |
${Red}   ( : '~'.~.'~' : )       ${Green} |_| |__,|___|  _|___|___|_| |_| |_  |  |  _|_|
${Red}    ~ .~ (   ) ~. ~        ${Green}             |_|                 |___|  |_|
${Red}     (  : '~' :  )
${Red}      '~ .~~~. ~'
${Red}          '~'

${Green}Hostname..............:   ${Red}$hostname
${Green}OS Version............:   ${Red}$debian_version
${Green}Kernel................:   ${Red}$kernel_version
${Green}Free..................:   ${Red}$mem_available
${Green}Uptime................:   ${Red}$up
${Green}Public IP.............:   ${Red}$ip_pub

${NC}"
#> $motd_file

# ${Green}Local IP..............:
# ${Red}$ip_lan
