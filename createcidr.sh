#/bin/bash
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[].ipv4Prefix | select (. != null)' >./GoogleIPv4.cidr
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[].ipv6Prefix | select (. != null)' >./GoogleIPv6.cidr
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/cloud.json | jq -r '.prefixes[].ipv4Prefix | select (. != null)' >>./GoogleIPv4.cidr
curl -s -H "Accept: application/json" https://www.gstatic.com/ipranges/cloud.json | jq -r '.prefixes[].ipv6Prefix | select (. != null)' >>./GoogleIPv6.cidr
