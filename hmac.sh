#!/bin/sh
SECRET='some-hmac-confidential-secret'

# ./hmac.sh "$(date -u '+%a, %d %b %Y %T GMT')" 1234

headers="date host request-line customerid"
signstring="date: ${1}"
signstring="${signstring}\nhost: localhost:8000"
signstring="${signstring}\nGET /dummy HTTP/1.1"
signstring="${signstring}\ncustomerid: ${2}"

HMAC=$(printf "$signstring" | openssl dgst -sha256 -hmac "${SECRET}" -binary | openssl enc -base64 -A)

echo "hmac username=\"hmac-user\", algorithm=\"hmac-sha256\", headers=\"$headers\", signature=\"$HMAC\""
