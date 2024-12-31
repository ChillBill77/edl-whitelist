#/bin/bash
mkdir -p 
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[].ipv4Prefix | select (. != null)' >./lists/GoogleIPv4.cidr
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[].ipv6Prefix | select (. != null)' >./lists/GoogleIPv6.cidr
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/cloud.json | jq -r '.prefixes[].ipv4Prefix | select (. != null)' >>./lists/GoogleIPv4.cidr
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/cloud.json | jq -r '.prefixes[].ipv6Prefix | select (. != null)' >>./lists/GoogleIPv6.cidr
curl -s -H "Accept: application/json" "https://endpoints.office.com/endpoints/worldwide?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7" | jq -r '.[] | select(.ips) |  .ips[]' >./lists/MicrosoftIP.cidr
curl -s -H "Accept: application/json" "https://endpoints.office.com/endpoints/worldwide?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7" | jq -r '.[] | select(.urls) |  .urls[]' >./lists/Microsoft.urls
