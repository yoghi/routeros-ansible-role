#!/usr/bin/expect

set timeout 10

set sshport [lindex $argv 0];

# set publicKey [lindex $argv 1];
#set publicKeyFile [lindex $argv 1];
#set publicKey [exec cat $publicKeyFile];

set publicKey "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjznsy+O85FAExMPwDiLpj7YTxs8Elsrt4a8dz361q/xKi79PbzsMia/59SB1NqaYLJmtcKw8ULf+ZYUB6uHcMfpr8Lowfd2nc2+auq/BZC1gW87rhrxKR34fKjUIvUByd7wiA3rxuZSvBhu415JgSbb1sA6X6rKwmqJNWqtsW03fBS5I0ZtgUFvzJmlT31USE4xSoYcjykmGbLnGRZ6fc1Ox84Vdj+OYugss6g0zzdGqAt93EtuGEmSy9xA6HjBm4ijBsruEvlX+AXRHGL3WHn4dSXL0yTcU7PebzqInCVDnrqf378qFpobMFf2mpvG2Kl+iaUXibN49hygiCfLsP user@work"

log_file -a "expect.log"

spawn ssh -q admin+cet@localhost -p $sshport

sleep 5

expect -re "(.*)admin(.*)" 

send "/user add name=\"routeradmin\" password=\"pAssw0rd!\" group=full\r"

sleep 1

expect -re "(.*)admin(.*)"

send "/file set developer.key.pub contents=\"$publicKey\"\r"

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
