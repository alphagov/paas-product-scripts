#!/bin/sh

set -e pipefail

read -p 'Start Date (e.g. 2017-10-28 21:00:00): ' STARTDATE
read -p 'End Date (e.g. 2017-10-28 22:00:00): ' ENDDATE

EPOCHSTART=$(TZ=Europe/London date -jf "%Y-%m-%d %H:%M:%S" "${STARTDATE}" "+%s")
EPOCHEND=$(TZ=Europe/London date -jf "%Y-%m-%d %H:%M:%S" "${ENDDATE}" "+%s")

ZULUSTARTDATE=$(TZ=Zulu date -jf "%s" $EPOCHSTART "+%Y-%m-%dT%H:%M:%SZ")
ZULUENDDATE=$(TZ=Zulu date -jf "%s" $EPOCHEND "+%Y-%m-%dT%H:%M:%SZ")

cf curl '/v2/events?q=type:app.crash&q=timestamp>'$ZULUSTARTDATE'&q=timestamp<'$ZULUENDDATE
