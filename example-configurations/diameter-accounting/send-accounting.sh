#!/bin/sh
# Replay sample NAS accounting events with cumulative usage.
set -eu

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    echo "Usage: $0 SERVER:PORT SESSION_ID [NAS_IDENTIFIER]" >&2
    exit 1
fi

server=$1
session_id=$2
nas_identifier=${3:-example_nas}

for status in 1 3 2; do
    case "$status" in
        1)
            duration=0
            input=0
            input_high=0
            output=0
            output_high=0
            ;;
        3)
            duration=60
            input=17
            input_high=2
            output=23
            output_high=3
            ;;
        2)
            duration=120
            input=29
            input_high=2
            output=37
            output_high=3
            ;;
    esac

    radiator-client \
        --server "$server" \
        --secret "${RADIATOR_RADIUS_SECRET:-mysecret}" \
        --type acct \
        --user accounting-example \
        --timeout 3s \
        --attr "NAS-Identifier=$nas_identifier" \
        --attr "Acct-Session-Id=$session_id" \
        --avp "40=u32,$status" \
        --avp "46=u32,$duration" \
        --avp "42=u32,$input" \
        --avp "52=u32,$input_high" \
        --avp "43=u32,$output" \
        --avp "53=u32,$output_high" \
        --attr "Class=accounting-example-class" \
        --expect-code Accounting-Response
done
