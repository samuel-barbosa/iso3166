#!/bin/bash
# Title           : iso3166-subdivisions.sh
# Description     : Outputs a CSV with the subdivisions of the given countries, by querying the iso.org database
# Author          : Samuel Barbosa
# Date            : 2025-06-24
# Version         : 1.0
# Usage           : echo -e 'BR\nUS\nIT' | ./iso3166-subdivisions.sh
# Notes           : The input should be a list of country codes as specified in the ISO-3166 (alpha-2)
# Dependencies    : curl, jq, yq

set -e 

# Exit if no input is provided via stdin
if [ -t 0 ]; then
  exit 0
fi

# Set URL for the ISO 3166-2 subdivisions service
SERVICE_URL=https://www.iso.org/obp/ui

# Output CSV header
echo '"category","3166-2-code","name","local variant","language code","romanization system","parent subdivision"'

# Read country codes from stdin
while IFS= read -r COUNTRY_CODE || [[ -n ${COUNTRY_CODE} ]]; do

  # Extract subdivisions for the given country code
  SUBDIVISIONS=$(
    curl --silent \
      --header 'content-type: application/x-www-form-urlencoded' \
      --data-urlencode 'v-browserDetails=1' \
      --data-urlencode 'theme=iso-red' \
      --data-urlencode "v-loc=${SERVICE_URL}/#iso:code:3166:${COUNTRY_CODE^^}" \
      --url "${SERVICE_URL}" \
      | jq '.uidl' \
      | jq -r \
      | jq -r '.. | objects | select(has("templateContents") and (.templateContents | contains("http://www.iso.org/ns/localization"))) | .templateContents' \
      | yq -p xml -o json \
      | jq '.. | objects | select(has("+@id") and ."+@id" == "subdivision").tbody.tr'
  )

  # If no subdivisions are found, skip to the next country code
  if [[ -z "${SUBDIVISIONS}" ]] || [[ "${SUBDIVISIONS}" == "null" ]]; then
    continue;
  fi

  # Format and output the subdivisions in CSV format
  jq -r '.[] | [.td[0], .td[1], .td[2], .td[3], .td[4], .td[5], .td[6]] | @csv' <<<"${SUBDIVISIONS}" 

done < /dev/stdin