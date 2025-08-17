#!/bin/bash

# Set notification title and message
TITLE="New Craft Alert!"
MESSAGE="Crafting material restocked! ⚒️"

# Set device token (replace with actual device token)
DEVICE_TOKEN="your_device_token_here"

# Set API key (replace with actual API key)
API_KEY="your_api_key_here"

# Set API endpoint URL
ENDPOINT_URL="https://your_api_endpoint_here.com/send-notification"

# Function to send notification
send_notification() {
  curl -X POST \
  $ENDPOINT_URL \
  -H 'Authorization: Bearer '$API_KEY'' \
  -H 'Content-Type: application/json' \
  -d '{"title":"'$TITLE'","message":"'$MESSAGE'","device_token":"'$DEVICE_TOKEN'"}'
}

# Check if notification should be sent
if [ $(date +'%H') -eq 8 ] && [ $(date +'%M') -eq 0 ]; then
  # Send notification at 8:00 every day
  send_notification
fi

# Schedule notification for every 1 hour
while true; do
  if [ $(date +'%M') -eq 0 ]; then
    send_notification
  fi
  sleep 1h
done