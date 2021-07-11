#!/bin/sh
LOG=/tmp/test_script_module.log
echo $0 > $LOG
ifconfig >> $LOG
