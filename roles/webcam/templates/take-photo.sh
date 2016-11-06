#!/bin/bash

# Take one photo from a connected USB camera

TIME=$(date +"%H-%M-%S")
DATE=$(date +"%Y-%m-%d")

IMG_DIR=/home/pi/timelapse/$DATE

if [ ! -d "$IMG_DIR" ]; then
  mkdir $IMG_DIR
fi

IMG_PATH=$IMG_DIR/$TIME.jpg

fswebcam -r 1920x1080 --skip 10 --font=/usr/share/fonts/OpenSans-Bold.ttf:32 --banner-colour='#FF000000' --line-colour='#FF000000' --shadow $IMG_PATH && \
	curl  -X POST -H "Content-type: application/json" \
	-d '{
      "title": "Rasperry Timelapse",
      "text": "Took a photograph, saved to '"$IMG_PATH"'",
      "priority": "normal",
      "tags": ["network:atc"],
      "alert_type": "info"
  	}' \
	'https://app.datadoghq.com/api/v1/events?api_key={{ datadog_api_key }}' && \
	exit 0

exit 1
