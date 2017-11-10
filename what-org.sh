#!/bin/sh

set -e pipefail

read -p 'Enter Org GUID: ' ORGGUID

cf curl /v2/organizations/$ORGGUID


