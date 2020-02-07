#!/usr/bin/expect

set timeout 10

set sshport [lindex $argv 0];

# set publicKey [lindex $argv 1];
set publicKeyFile [lindex $argv 1];

log_file -a "expect.log"

spawn ssh -q admin+cet@localhost -p $sshport

sleep 5

expect -re "(.*)admin(.*)" 

send "/user add name=\"routeradmin\" password=\"pAssw0rd!\" group=full\r"

sleep 1

expect -re "(.*)admin(.*)"

send "/user ssh-keys import public-key-file=developer.key.pub user=routeradmin\r"

sleep 1

expect -re "(.*)admin(.*)"

send "/user ssh-keys print\r"

sleep 1

expect -re "(.*)admin(.*)"

send "/user remove admin\r"

sleep 1

expect -re "(.*)admin(.*)"

send "quit\r"

expect eof

send_user "user security success!\n"

exit 0
