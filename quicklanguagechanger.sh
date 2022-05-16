#!/bin/bash

echo "Please type interface language and region"
echo ""

echo "Set interface language:"
read $var_a

echo "LANG=$var_a
LANGUAGE=$var_a" | tee -a /etc/locale.conf /etc/default/locale

clear

echo "Set region:"
read $var_b

echo "LC_NUMERIC=$var_b
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
