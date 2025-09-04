FROM debian:bookworm

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    postfix dovecot-imapd dovecot-pop3d opendkim opendkim-tools \
    clamav clamav-daemon supervisor rsyslog && \
    rm -rf /var/lib/apt/lists/*

COPY dkim-setup.sh /usr/local/bin/dkim-setup.sh
RUN chmod +x /usr/local/bin/dkim-setup.sh

CMD ["/usr/bin/supervisord", "-n"]

