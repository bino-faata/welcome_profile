#!/bin/bash
#
# Custom Welcome message for PortaOne Linux Administration course
# Version 0.1
# Date September 18 2022
#
#
clear
sleep 1
echo ''
echo -e '\e[36m /$$$$$$$                        /$$                /$$$$$$                     '
echo -e '| $$__  $$                      | $$               /$$__  $$                    '
echo -e '| $$  \ $$  /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$ | $$  \ $$ /$$$$$$$   /$$$$$$ '
echo -e '| $$$$$$$/ /$$__  $$ /$$__  $$|_  $$_/   |____  $$| $$  | $$| $$__  $$ /$$__  $$'
echo -e '| $$____/ | $$  \ $$| $$  \__/  | $$      /$$$$$$$| $$  | $$| $$  \ $$| $$$$$$$$'
echo -e '| $$      | $$  | $$| $$        | $$ /$$ /$$__  $$| $$  | $$| $$  | $$| $$______'
echo -e '| $$      |  $$$$$$/| $$        |  $$$$/|  $$$$$$$|  $$$$$$/| $$  | $$|  $$$$$$$'
echo -e '|__/       \______/ |__/         \___/   \_______/ \______/ |__/  |__/ \_______/\e[0m'
echo ''
echo -e "\e[33mSysInfo ---------------------------------             Server Services status -----------------\e[0m"
echo -e "\e[32mUPTIME: \e[0m" $(uptime -p) "                       \e[32mHTTPD: \e[0m" $(systemctl show -p ActiveState --value "httpd")
echo -e "\e[32mHOSTNAME: \e[0m" $(hostname) "                                 \e[32mMySQL: \e[0m" $(systemctl show -p ActiveState --value "mysql")
echo -e "\e[32mDISTRIBUTIVE: \e[0m" $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d "=" -f 2- | sed 's/"//g') "               \e[32mMySQLd: \e[0m" $(systemctl show -p ActiveState --value "mysqld")
echo -e "\e[32mCPU LOAD: \e[0m" $(cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}') "                         \e[32mFirewalld: \e[0m" $(systemctl show -p ActiveState --value "firewalld")
echo -e "\e[32mFREE MEMORY: \e[0m" $(free -m | head -n 2 | tail -n 1 | awk {'print $4'})"Mb" "                                 \e[32mCrond: \e[0m" $(systemctl show -p ActiveState --value "crond")
echo -e "\e[32mFREE DISK SPACE: \e[0m" $(df -h / | awk '{ a = $2 } END { print a }') "                               \e[32miptables: \e[0m" $(systemctl show -p ActiveState --value "iptables")
echo ''
echo -e "\e[33mUseful params ---------------------------\e[0m"
echo -e "\e[32mForward status: \e[0m" $(sysctl net.ipv4.ip_forward)
echo -e "\e[32mPATH env: \e[0m" $(printenv | grep PATH)
echo -e "\e[32mSSH params: \e[0m" $(printenv | grep SSH)
echo -e "\e[32mSockets: \e[0m"
ss -tunlp
echo ''
echo ''
