#! /usr/bin/expect
set timeout 5
spawn ssh -p [lindex $argv 0] [lindex $argv 1]@[lindex $argv 2] -i [lindex $argv 4]
expect {
        "(yes/no)?"
        {send "yes\n";exp_continue}
	".pem':"
        {send "[lindex $argv 3]\n"}
}
interact
