#!/bin/bash

set -a
source /WebServer/traefik/.env
set +a

echo $EMAIL

curl https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID \
    -X PUT \
    -H 'Content-Type: application/json' \
    -H "X-Auth-Email: $EMAIL" \
    -H "X-Auth-Key: $CLOUDFLARE_API_KEY" \
    -d '{
      "comment": "Domain verification record",
      "content": "198.51.100.4",
      "name": "example.com",
      "proxied": true,
      "ttl": 3600,
      "type": "A"
    }' -y