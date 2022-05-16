#!/bin/bash

var_a="en_US.UTF-8"
var_b="pl_PL.UTF-8"

echo "Default interface language is set to '$var_a' and region is set to '$var_b'"
echo "Please type interface language and region"
echo ""

echo "Set interface language:"
read $var_a
clear
echo "Interface language set to: $var_a"

echo ""
echo "Set region:"
read $var_b
clear
echo "Region set to: $var_b"

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
