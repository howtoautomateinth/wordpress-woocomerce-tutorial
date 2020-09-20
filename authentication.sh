# Bash example
STORE_URL='http://localhost:8000'
ENDPOINT='/wc-auth/v1/authorize'
PARAMS="app_name=My App Name&scope=read_write&user_id=123&return_url=http://localhost:8000/return-page&callback_url=https://localhost:8000/callback-endpoint"
QUERY_STRING="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$PARAMS")"
QUERY_STRING=$(echo $QUERY_STRING | sed -e "s/%20/\+/g" -e "s/%3D/\=/g" -e "s/%26/\&/g")

echo "$STORE_URL$ENDPOINT?$QUERY_STRING"