#!/usr/bin/expect

set hostname [exec hostname]

set original_file "/home/work/nginx"

set local_file [exec readlink -f $original_file]
set remote_user "miops"
set remote_host "10.224.122.172"
set remote_path "/home/miops/compare/$hostname"
set password "123"

spawn scp -r "$local_file" "$remote_user@$remote_host:$remote_path"
expect {
    "yes/no" {
        send "yes\r"
        exp_continue
    }
    "password:" {
        send "$password\r"
        interact
    }
    eof
}