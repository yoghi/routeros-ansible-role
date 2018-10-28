#!/usr/bin/expect

set timeout 10

set sshport [lindex $argv 0];

log_file -a "expect.log"

spawn ssh -q admin+cet@localhost -p $sshport

sleep 5

expect -re "(.*)Do you want to see the software license(.*)"

send_user "licenza richiesta\n"

send "n\r"

sleep 1

expect -re "(.*)admin(.*)" 

send "quit\r"

expect eof

send_user "license accept success!\n"

exit 0
