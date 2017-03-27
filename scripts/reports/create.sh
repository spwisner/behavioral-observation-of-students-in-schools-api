
  API="${API_ORIGIN:-http://localhost:4741}"
  URL_PATH="/students/1/sessions/228/reports"
  curl "${API}${URL_PATH}" \
    --include \
    --request POST \
    --header "Content-Type: application/json" \
    --header "Authorization: Token token=${TOKEN}" \
    --data '{
      "report": {
        "presenting_issue": "z",
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



# URL_PATH="/students/${STUDENT_ID}/sessions"
    # --data '{
    #   "session": {
    #     "obs_on": "'"${OBS_ON}"'",
    #     "obs_setting": "'"${OBS_SETTING}"'",
    #     "obs_task": "'"${OBS_TASK}"'",
    #     "obs_time": "'"${OBS_TIME}"'",
    #     "int_num": "'"${INT_NUM}"'"
    #   }
    # }'

echo

#STUDENT_ID=1 TOKEN="" OBS_ON=2016-05-05 OBS_TASK="Z" OBS_SETTING="Z" OBS_TIME=3 INT_NUM=3 sh scripts/sessions/create.sh
