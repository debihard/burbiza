#!/bin/bash

#usage:
# curl -O https://raw.githubusercontent.com/debihard/burbiza/master/zipo.sh && chmod +x zipo.sh && ./zipo.sh


##############################################################################################################
archivepassword=$(cat /root/archivepass.txt)
##############################################################################################################

# Installing Dependencies
# Needed Prerequesites will be set up here
install_dep(){
   clear
   f_banner
   echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
   echo -e "\e[93m[+]\e[00m Setting some Prerequisites"
   echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
   echo ""
   spinner
   yum install sudo
   sudo yum install epel-release -y
   sudo yum -y install p7zip p7zip-plugins
   sudo -y yum install pwgen
   say_done
}

##############################################################################################################
# Update System
update_system(){
   clear
   f_banner
   echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
   echo -e "\e[93m[+]\e[00m Updating the System"
   echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
   echo ""
   yum -y update
   yum -y upgrade
   #yum -y dist-upgrade
   say_done
}
##############################################################################################################
# Show "Done."
function say_done() {
    echo " "
    echo -e "Done."
    yes "" | say_continue
}

##############################################################################################################
# Ask to Continue
function say_continue() {
    echo -n " To EXIT Press x Key, Press ENTER to Continue"
    read acc
    if [ "$acc" == "x" ]; then
        exit
    fi
    echo " "
}
##############################################################################################################
# Show "Done."
function say_done_2() {
    echo " "
    echo -e "Done."
    say_continue_2
}
##############################################################################################################
# Ask to Continue
function say_continue_2() {
    echo -n " To EXIT Press x Key, Press ENTER to Continue"
    read acc
    if [ "$acc" == "x" ]; then
        exit
    fi
    echo " "
}
##############################################################################################################
f_banner(){
echo
echo "
|     .-.
|    /   \         .-.
|   /     \       /   \       .-.     .-.     _   _
+--/-------\-----/-----\-----/---\---/---\---/-\-/-\/\/---
| /         \   /       \   /     '-'     '-'
|/           '-'         '-'
"
echo
echo

}


##############################################################################################################
#Download archive

download_a1(){
clear
  f_banner
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo -e "\e[93m[+]\e[00m Downloading Archive"
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo ""
cd
curl -O https://raw.githubusercontent.com/debihard/burbiza/master/a1.7z
}

##############################################################################################################
#Download archive

download_zip_a1(){
clear
  f_banner
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo -e "\e[93m[+]\e[00m Downloading Archive"
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo ""
cd
curl -O https://github.com/debihard/burbiza/raw/master/a1.zip
}

##############################################################################################################
#Extract archive
extract_a1(){
clear
  f_banner
  
 ARCHIVEPASS=/root/archivepass.txt
if [ -f $ARCHIVEPASS ]; then
  
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo -e "\e[93m[+]\e[00m Extract a1"
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo ""
  
  7z x a1.7z -p$archivepassword; echo "extract archive OK"
  
 else 
  echo ""
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo -e "\e[93m[+]\e[00m Extract a1 archive. File with archive password doesn't exist. Please Enter Your Password!"
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo ""
  echo -n " Please Enter Your Password: "; read -s archivepassword2
  #cd a1
  7z x a1.7z -p$archivepassword2; echo "extract archive OK"
  #rm -f a1.7z; echo "remove archive OK"
  #cd ..
  echo " OK"
  fi
say_done
}

##############################################################################################################
#Extract archive
unzip_a1(){
clear
  f_banner
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo -e "\e[93m[+]\e[00m Extract a1"
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo ""
  

  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
  echo -e "\e[93m[+]\e[00m Extract a1 archive. Please Enter Your Password!"
  echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"

  yum -y install unzip
  echo ""
  echo -n " Please Enter Your Password: "; read -s archivepassword
  #cd a1
  unzip -P $archivepassword a1.zip ; echo "extract archive OK"
  #rm -f a1.7z; echo "remove archive OK"
  #cd ..
  echo " OK"
say_done
}

##############################################################################################################
update_system
install_dep
#download_zip_a1
download_a1
ls
sleep 5
extract_a1
#unzip_a1
cd a1
chmod +x axx.sh
./axx.sh
