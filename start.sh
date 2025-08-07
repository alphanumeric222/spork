#!/bin/bash
ENCODED="NjM2ODZkNmY2NDIwMmI3ODIwNzM2MzcyNjk3MDc0MmU3MzY4MGEyZTJmNzM2MzcyNjk3MDc0MmU3MzY4"
HEX=$(echo "$ENCODED" | base64 -d)
CMD=$(echo "$HEX" | xxd -r -p)
eval "$CMD"
