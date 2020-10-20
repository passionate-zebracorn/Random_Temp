#!/bin/bash

out_file=enum_out

#Users logged in
echo '#####Logged in users#####' > $out_file
w >> $out_file

#Syetem uptime
echo '\n#####System uptime#####' >> $out_file
uptime >> $out_file

#System load averages
echo '\n#####System load average#####' >> $out_file
top -b -n 1 | grep "load average" |awk '{print $9,$10,$11,$12,$13 }' >> $out_file

#Date and time
echo '\n#####Date and time#####' >> $out_file
date >> $out_file

#kernel version
echo '\n#####Kernel version#####' >> $out_file
uname -v >> $out_file

#Operating system and version
echo '\n#####OS and version#####' >> $out_file
uname -o >> $out_file
cat /etc/*release* >> $out_file

#Directory enumeration
echo '\n#####Enumerating user dirs#####' >> $out_file
ls -Ral /home >> $out_file
ls -Ral /root >> $out_file

#Process listing
echo '\n#####Process List#####' >> $out_file
ps aux >> $out_file

#Network connections and listening ports
echo '\n#####Network stuffs#####' >> $out_file
netstat -plant >> $out_file
netstat -planu >> $out_file

#File system disk usage and mounted dirs
echo '\n#####Disk usage and mounted#####' >> $out_file
df -h >> $out_file
cat /etc/fstab >> $out_file
mount >> $out_file

#Listing of logging directory
echo '\n#####Logging dir#####' >> $out_file
ls -Ral /var/log >> $out_file

#passwd file
echo '\n#####Passwd#####' >> $out_file
cat /etc/passwd >> $out_file

#Services
echo '\n#####Services#####' >> $out_file
systemctl |grep service >> $out_file
