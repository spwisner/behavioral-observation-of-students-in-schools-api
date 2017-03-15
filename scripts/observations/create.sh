
  API="${API_ORIGIN:-http://localhost:4741}"
  URL_PATH="/students/${STUDENT_ID}/sessions/${SETTING_ID}/observations"
  curl "${API}${URL_PATH}" \
    --include \
    --request POST \
    --header "Content-Type: application/json" \
    --header "Authorization: Token token=${TOKEN}" \
    --data '{
      "observation": {
        "aet": "'"${AET}"'",
        "pet": "'"${PET}"'",
        "oft_m": "'"${OFT_M}"'",
        "oft_v": "'"${OFT_V}"'",
        "oft_p": "'"${OFT_P}"'",
        "obs_comment": "'"${OBS_COMMENT}"'",
        "obs_num": "'"${OBS_NUM}"'"
      }
    }'

echo
