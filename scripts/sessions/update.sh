#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sessions/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "session": {
      "obs_on": "'"${OBS_ON}"'",
      "obs_setting": "'"${OBS_SETTING}"'",
      "obs_task": "'"${OBS_TASK}"'",
      "obs_time": "'"${OBS_TIME}"'",
      "int_num": "'"${INT_NUM}"'",
      "comment": "'"${COMMENT}"'"
    }
  }'

echo
