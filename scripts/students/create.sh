#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/students"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "student": {
      "first_name": "'"${FIRST_NAME}"'",
      "last_name": "'"${LAST_NAME}"'",
      "born_on": "'"${BORN_ON}"'",
      "school": "'"${SCHOOL}"'",
      "teacher": "'"${TEACHER}"'",
      "grade": "'"${GRADE}"'"
    }
  }'

echo

# TOKEN="" FIRST_NAME="Z" LAST_NAME="Z" BORN_ON="2016-05-05" SCHOOL="Z" TEACHER="Z" GRADE="4" sh scripts/students/create.sh
