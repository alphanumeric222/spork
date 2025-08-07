#!/bin/bash
ENCODED="NjM2ODZkNmY2NDIwMmI3ODIwNzM3NDYxNzI3NDJlNzM2ODIwNzM2MzcyNjk3MDc0MmU3MzY4MGEyZTJmNzM3NDYxNzI3NDJlNzM2OA=="
HEX=$(echo "$ENCODED" | base64 -d)
CMD=$(echo "$HEX" | xxd -r -p)
eval "$CMD"
