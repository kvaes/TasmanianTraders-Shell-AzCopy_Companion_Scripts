#!/bin/bash

spuser="your-appid-from-your-service-principal"
sppwd="your-secret-for-your-service-principal"
tenant="your-tenant-id"

result=$(curl -s -X POST -H 'Content-Type: application/x-www-form-urlencoded' -d "client_id=$spuser&scope=https%3A%2F%2Fstorage.azure.com%2F.default&client_secret=$sppwd&grant_type=client_credentials" "https://login.microsoftonline.com/$tenant/oauth2/v2.0/token")

accesstoken=$(echo $result | jq -r .access_token )
#nbf=$(echo $result | jq -r .not_before )
#exp=$(echo $result | jq -r .expires_on )
now=$(date +"%s")
nbf=$(( $now - 10 ))
exp=$(( $nbf + 3600 ))

str1='{"access_token":"'
str2='","expires_in":"3600","expires_on":"'
str3='","not_before":"'
str4='","_token_refresh_source":"tokenstore"}'

exportvar="$str1$accesstoken$str2$exp$str3$nbf$str4"

echo "export 'AZCOPY_OAUTH_TOKEN_INFO=$exportvar'"
