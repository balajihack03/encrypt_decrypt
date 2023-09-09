#!/bin/bash
 echo "
  ____  _   _    _        ____  ____   __                                      _   
 / ___|| | | |  / \      |___ \| ___| / /_     ___ _ __   ___ _ __ _   _ _ __ | |_ 
 \___ \| |_| | / _ \ _____ __) |___ \| '_ \   / _ \ '_ \ / __| '__| | | | '_ \| __|
  ___) |  _  |/ ___ \_____/ __/ ___) | (_) | |  __/ | | | (__| |  | |_| | |_) | |_ 
 |____/|_| |_/_/   \_\   |_____|____/ \___/   \___|_| |_|\___|_|   \__, | .__/ \__|
                                                                   |___/|_|                                                                       
   ___     ____                             _   
  ( _ )   |  _ \  ___  ___ _ __ _   _ _ __ | |_ 
  / _ \/\ | | | |/ _ \/ __| '__| | | | '_ \| __|
 | (_>  < | |_| |  __/ (__| |  | |_| | |_) | |_ 
  \___/\/ |____/ \___|\___|_|   \__, | .__/ \__|
                                |___/|_|         by balajihack03"

read -p "Do you want encrypt or decrypt ? " method

echo "#############################################"
echo ""					          
echo "Checking Requirments...."
sleep 4s
if openssl version >/dev/null  2>&1; then
echo "openssl already Installed. [200]"
else
echo "openssl Not Installed, Installing openssl [404]"
sudo apt-get install openssl
fi
if tar --version >/dev/null  2>&1 ; then
echo "tar already Installed. [200]"
else
echo "tar Not Installed, Installing tar [404]"
sudo apt-get install tar
fi
case $method in
#decryption
    decrypt|Decrypt|DECRYTP)
    read -p "Enter decryption file or folder path: " encrypted_file
    read -p "Enter decryption output File Path: " path
    read -s -p "Enter decryption password: " password
    openssl enc -d -aes-256-cbc -in "$encrypted_file" -out - -k "$password" | tar -xf - -C "$path" 
    echo "decryption is successfully completed##########"
    ;;
    #Encryption
    encrypt|Encrypt|ENCRYPT)
    read -p "Enter Encrypt file or folder path: " folder_to_encrypt
    read -p 'Enter output file path and File name: ' path
    read -s -p "Enter Encryption password: " password
    tar -cf - "$folder_to_encrypt" | openssl enc -aes-256-cbc -salt -out "$path.tar.enc" -k "$password"
    echo "Encryption is successfully completed##########"
    ;;
esac


