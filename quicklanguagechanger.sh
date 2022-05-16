#!/bin/bash
sudo rm -rf /etc/locale.conf
sudo rm -rf /etc/default/locale
read -p 'Interface language: (e.g. en_US.UTF-8)' var_a
read -p 'Enter region: (e.g. pl_PL.UTF-8)' var_b
echo "LANG=$var_a
LANGUAGE=$var_a
LC_NUMERIC=$var_b
LC_TIME=$var_b
LC_COLLATE=$var_b
LC_MONETARY=$var_b
LC_MESSAGES=$var_b
LC_PAPER=$var_b
LC_NAME=$var_b
LC_ADDRESS=$var_b
LC_TELEPHONE=$var_b
LC_MEASUREMENT=$var_b
LC_IDENTIFICATION=$var_b" | tee -a /etc/locale.conf /etc/default/locale
echo "Replaced /etc/locale.conf & /etc/default/locale successfully"
