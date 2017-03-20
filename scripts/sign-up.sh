#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-up"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "z@z",
      "password": "z",
      "password_confirmation": "z"
    }
  }'


  # --data '{
  #   "credentials": {
  #     "email": "'"${EMAIL}"'",
  #     "password": "'"${PASSWORD}"'",
  #     "password_confirmation": "'"${PASSWORD}"'"
  #   }
  # }'

echo
