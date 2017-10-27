#!/bin/sh

set -e pipefail

read -p 'Enter Space GUID: ' SPACEGUID

cf curl /v2/spaces/$SPACEGUID

