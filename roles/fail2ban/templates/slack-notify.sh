#!/usr/bin/env bash
MESSAGE=$1
POST_URL="https://slack.com/api/chat.postMessage"
API_TOKEN="xoxb-136633984676-EdRv1Eh4wHUMIoe6lGAxLfTo"
HOST=$(hostname)
HOST_IP=$(ip route get 8.8.8.8| grep src| sed 's/.*src \(.*\)$/\1/g')

CHANNEL="#fail2ban"
USERNAME="fail2ban-bot"

# ip second command argument
if [ "$#" -ge 2 ]; then
    IP=$2
    # lets find out from what country we have our hacker
    COUNTRY=$(curl ipinfo.io/${IP}/country)
    # converting country to lover case. I love you bash script =\
    COUNTRY=$(echo "$COUNTRY" | tr -s  '[:upper:]'  '[:lower:]')
    # slack emoji
    COUNTRY=":flag-$COUNTRY:"

    # replace _country_ template to the country emoji
    MESSAGE="${MESSAGE/_country_/$COUNTRY}"
fi

CURL_PAYLOAD="channel=${CHANNEL}&username=${USERNAME}&as_user=true&text=[*${HOST} - ${HOST_IP}*] ${MESSAGE}&token=${API_TOKEN}"
if [ "$3" = "ban" ]; then
    MESSAGE_DETAIL=$(grep "${IP}" /var/log/auth.log | tail -n 5)
    CURL_PAYLOAD="$CURL_PAYLOAD&attachments=[{\"title\": \"Ban log:\", \"text\": \"\`\`\`${MESSAGE_DETAIL}\`\`\`\", \"color\": \"danger\", \"mrkdwn_in\": [\"text\"]}]"
fi

curl -X POST -d "${CURL_PAYLOAD}" ${POST_URL}

exit 0
