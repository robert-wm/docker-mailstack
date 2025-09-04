#!/bin/sh
# Generates DKIM keys for domain
mkdir -p /var/lib/rspamd/dkim
opendkim-genkey -b 2048 -d example.com -D /var/lib/rspamd/dkim -s mail -v
chown -R opendkim:opendkim /var/lib/rspamd/dkim
echo "DKIM keys generated."
