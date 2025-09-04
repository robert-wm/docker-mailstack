#!/bin/sh
fail2ban-client start
tail -f /var/log/mail.log
