/var/log/kafka/*.log {
    weekly
    rotate 4
    maxsize 100M
    minsize 10M
    copytruncate
    delaycompress
    compress
    notifempty
    missingok
}
