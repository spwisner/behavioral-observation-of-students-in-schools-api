
  API="${API_ORIGIN:-http://localhost:4741}"
  URL_PATH="/students/1/sessions/88/observations"
  curl "${API}${URL_PATH}" \
    --include \
    --request POST \
    --header "Content-Type: application/json" \
    --header "Authorization: Token token=${TOKEN}" \
    --data '{
      "observation": {
        "obs_comment": "none"
      }
    }'

echo

# STUDENT_ID=1 SESSION_ID=2 TOKEN="" AET=1 PET=1 OFT_M=1 OFT_P=1 OFT_V=1 OBS_COMMENT="NONE" OBS_NUM=1 sh scripts/observations/create.sh

# --data '{
#   "observation": {
#     "aet": "true",
#     "pet": "true",
#     "oft_m": "false",
#     "oft_v": "true",
#     "oft_p": "false",
#     "obs_comment": "none",
#     "obs_num": "4"
#   }
# }'
