#!/bin/bash

rm -f /run/pcscd/pcscd.comm >/dev/null 2>&1

pcscd -f --error &
sleep 1

exec "$@"

