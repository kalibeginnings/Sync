sudo chkrootkit

Also, There are other useful tools to review after installing chkrootkit

[root:/usr/lib/chkrootkit]# ls -l
total 808
-rwxr-xr-x 1 root root 6120 Mar 23 2015 check_wtmpx
-rwxr-xr-x 1 root root 10360 Mar 23 2015 chkdirs
-rwxr-xr-x 1 root root 8784 Mar 23 2015 chklastlog
-rwxr-xr-x 1 root root 10480 Mar 23 2015 chkproc
-rwxr-xr-x 1 root root 10352 Mar 23 2015 chkutmp
-rwxr-xr-x 1 root root 5808 Mar 23 2015 chkwtmp
-rwxr-xr-x 1 root root 10456 Mar 23 2015 ifpromisc
-rwxr-xr-x 1 root root 746408 Mar 23 2015 strings-static


I suggest to try them all.

lynis - open source security auditing tool. Comes with Kali


#lynis --update
#lynis audit system


Useful Commands

-Check Services running


# chkconfig --list |grep '3:on'

-ShutdownService


# chkconfig serviceName off

----Check Listening Ports


# netstat -tulpn

---- Close Unwanted Ports


# iptables -A INPUT -p tcp --dport PORT_NUMBER -j DROP

---Review IP Tables


# Iptables –L –n –v


---Checking Accounts for Empty Passwords


# cat /etc/shadow | awk -F: '($2==""){print $1}'

Display Failed Logins

# faillog

----- Logs to review

/var/log/message – Where whole system logs or current activity logs are available.
/var/log/auth.log – Authentication logs.
/var/log/kern.log – Kernel logs.
/var/log/cron.log – Crond logs (cron job).
/var/log/maillog – Mail server logs.
/var/log/boot.log – System boot log.
/var/log/mysqld.log – MySQL database server log file.
/var/log/secure – Authentication log.
/var/log/utmp or /var/log/wtmp : Login records file.



Useful Tools
Basic tools:
lynis - security auditing tool for Unix based systems
rkhunter - rootkit, backdoor, sniffer and exploit scanner
chkrootkit - rootkit detector
tripwire - file and directory integrity checker
tiger - Report system security vulnerabilities

Others:
bastille - Security hardening tool
unhide - Forensic tool to find hidden processes and ports
unhide.rb - Forensic tool to find processes hidden by rootkits
aide - Advanced Intrusion Detection Environment
bsign - Corruption & intrusion detection using embedded hashes
systraq - monitor your system and warn when system files change
snort - flexible Network Intrusion Detection System
psad - Port Scan Attack Detector
samhain - Data integrity and host intrusion alert system

Links and Material
IPTable Guide (https://evilzone.org/tutorials/%28tutorial%29-hardening-your-linux-box-with-iptables/)

25 Most Frequently Used Linux IPTables Rules Examples (http://www.thegeekstuff.com/2011/06/iptables-rules-examples/)

IPTables rule generator (http://www.perturb.org/content/iptables-rules.html)

25 Hardening Security Tips for Linux Servers (http://www.tecmint.com/linux-server-hardening-security-tips/)

Clam AV Source (http://www.clamav.net/download.html)
