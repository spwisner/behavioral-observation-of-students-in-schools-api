#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sessions/${ID}"
# URL_PATH="/students/2/sessions/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "session": {
        "obs_setting": "z",
        "obs_task": "z",
        "obs_time": "12",
        "int_num": "2",
        "comment": "none"
      }
    }'

echo
