#!/usr/bin/env bash

set -euo pipefail

quota_url=$(cf curl '/v2/quota_definitions?q=name:default' \
    | jq '.resources[].metadata.url')

from_date=$(($(date '+%s') - 3600*24*90))

cf curl /v2/organizations \
    | jq -r ".resources[] | select (.entity.quota_definition_url == ${quota_url}) | select ( .metadata.created_at | fromdateiso8601? < ${from_date}) | [.entity.name,.metadata.created_at] | @tsv"
