#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/reports/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "report": {
      "presenting_issue": "MAjor",
      "class_behav_assess": "z",
      "r_setting": "z",
      "r_aet": "12",
      "r_pet": "2",
      "r_oftm": "z",
      "r_oftv": "z",
      "r_oftp": "z",
      "r_finding": "12",
      "r_customone": "2",
      "r_customtwo": "z",
      "r_customthree": "12",
      "r_recommendation": "2",
      "counselor_name": "z z"
    }
  }'

echo
