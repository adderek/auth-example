#!/bin/sh
d="$(date -u '+%a, %d %b %Y %T GMT')"
curl localhost:8000/dummy \
  -H "date: $d" \
  -H 'CustomerID: 1234' -H "Authorization: $(./hmac.sh "$d" 1234)"

