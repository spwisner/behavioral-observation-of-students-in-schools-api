
  API="${API_ORIGIN:-http://localhost:4741}"
  URL_PATH="/students/${STUDENT_ID}/sessions/${SESSION_ID}/observations"
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

# STUDENT_ID=1 SESSION_ID=2 TOKEN="" AET=1 PET=1 OFT_M=1 OFT_P=1 OFT_V=1 OBS_COMMENT="NONE" OBS_NUM=1 sh scripts/observations/create.sh
