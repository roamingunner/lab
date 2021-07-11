#!/bin/sh
LOG=/tmp/test_script_module.txt
echo $0 > $LOG
ifconfig >> $LOG
