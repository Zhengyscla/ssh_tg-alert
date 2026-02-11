#!/bin/sh

BOT_TOKEN=""
CHAT_ID=""

# 只在 SSH 登录时执行
[ -z "$SSH_CONNECTION" ] && exit 0

IP=$(echo "$SSH_CONNECTION" | awk '{print $1}')
USER=$(whoami)
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)

# 查询国家
COUNTRY=$(curl -s --max-time 3 "https://api.country.is/$IP" \
          | sed -n 's/.*"country":"\([^"]*\)".*/\1/p')

[ -z "$COUNTRY" ] && COUNTRY="Unknown"

TEXT="🔐 SSH Login Alert

Host: $HOST
User: $USER
IP: $IP
Country: $COUNTRY
Time: $DATE"

(
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     -d text="$TEXT" > /dev/null 2>&1
) &

exit 0
