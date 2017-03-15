
  API="${API_ORIGIN:-http://localhost:4741}"
  URL_PATH="/students/${STUDENT_ID}/sessions"
  curl "${API}${URL_PATH}" \
    --include \
    --request POST \
    --header "Content-Type: application/json" \
    --header "Authorization: Token token=${TOKEN}" \
    --data '{
      "session": {
        "obs_on": "'"${OBS_ON}"'",
        "obs_setting": "'"${OBS_SETTING}"'",
        "obs_task": "'"${OBS_TASK}"'",
        "obs_time": "'"${OBS_TIME}"'"
      }
    }'

echo
