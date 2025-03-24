#!/bin/bash
source /WebServer/traefik/.env

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)

curl https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID \
    -X PUT \
    -H 'Content-Type: application/json' \
    -H "X-Auth-Email: $EMAIL" \
    -H "Authorization: Bearer $CF_DNS_API_TOKEN" \
    -d '{
      "comment": "Domain verification record",
      "content": "'$PUBLIC_IP'",
      "name": "pennyxz.com",
      "proxied": true,
      "ttl": 3600,
      "type": "A"
    }'
