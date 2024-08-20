*Ограничение входа в систему по времени*
## /etc/security/pam_time.conf
```login;tty* & !ttyp*; !root & admin & ; !Al0800-1900```
##
Так-же нужно добавить pam_time.so в sshd и system_auth
