#!/bin/sh

set -e pipefail

read -p 'Start Date (e.g. 2017-10-28 21:00:00): ' STARTDATE
read -p 'End Date (e.g. 2017-10-28 22:00:00): ' ENDDATE

EPOCHSTART=$(TZ=Europe/London date -jf "%Y-%m-%d %H:%M:%S" "${STARTDATE}" "+%s")
EPOCHEND=$(TZ=Europe/London date -jf "%Y-%m-%d %H:%M:%S" "${ENDDATE}" "+%s")

ZULUSTARTDATE=$(TZ=Zulu date -jf "%s" $EPOCHSTART "+%Y-%m-%dT%H:%M:%SZ")
ZULUENDDATE=$(TZ=Zulu date -jf "%s" $EPOCHEND "+%Y-%m-%dT%H:%M:%SZ")

for i in $(cf curl '/v2/events?q=type:app.crash&q=timestamp>'$ZULUSTARTDATE'&q=timestamp<'$ZULUENDDATE| jq -r '.resources[ ] | (.entity.actee)'); do

echo "######################################################################## #######################################"
echo "########## Org info ##########################################################################################"
cf curl /v2/organizations?q=space_guid:$(cf curl "/v2/events?q=actee:"$i"&q=timestamp>"$ZULUSTARTDATE"&q=timestamp<"$ZULUENDDATE \
| jq -r '.resources[0].entity.space_guid';) | jq -r '.resources[].entity'
echo "###############################################################################################################"
echo "########## actee: "$i" #######################################################"
cf curl "/v2/events?q=actee:"$i"&q=timestamp>"$ZULUSTARTDATE"&q=timestamp<"$ZULUENDDATE \
| jq -r '.resources[].entity | [.actor_name, .actee_name, .metadata]';
echo "########################## #####################################################################################"
echo "###############################################################################################################"
done

