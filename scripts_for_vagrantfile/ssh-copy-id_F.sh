#!/usr/bin/expect -c
set timeout 10
set f [open "hostsfile"]
set hosts [split [read -nonewline $f] "\n"]
close $f

foreach host $hosts {
    spawn ssh-copy-id -i /home/vagrant/.ssh/ansible-use-ssh-key.pub $host
    expect {
            "password:" {
                    send "vagrant\r"
                    exp_continue
                }
                "already exist on the remote system." {
                    exp_continue
                }
                "(yes/no)?" {
                    send "yes\r"
                    exp_continue
                }
    eof
        }
}
puts done