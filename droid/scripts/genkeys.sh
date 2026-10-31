#!/bin/bash
set -Eeo pipefail

################################################################################
# generate own android signing keys/certificates (never overwrites existing)   #
#                                                                              #
# usage: genkeys.sh [apex_name ...]                                            #
#   apex_name = APEX package name (e.g. com.android.adbd), gets its own        #
#   4096 bit key (.pk8, .x509.pem) and payload key (.pem)                      #
#                                                                              #
# Keys are created directly with openssl (same result as development/tools/    #
# make_key, but without its named pipes which can hang with newer openssl).    #
# Keys have no password (keeps the build non-interactive).                     #
#                                                                              #
# configuration (environment variables, set in droidenv.sh):                   #
#   EVDOCKER_KEYSDIR        where keys are stored                              #
#   EVDOCKER_CERT_SUBJECT   certificate subject                                #
#   EVDOCKER_KEY_NAMES      space separated list of keys to generate           #
#   EVDOCKER_GEN_AVB        1 = also generate AVB key (avb.pem, avb_pkmd.bin)  #
#   EVDOCKER_LINEAGEDIR     lineage tree (only for AVB key)                    #
################################################################################

keysdir="${EVDOCKER_KEYSDIR:?EVDOCKER_KEYSDIR not set (login shell?)}"
subject="${EVDOCKER_CERT_SUBJECT:?EVDOCKER_CERT_SUBJECT not set}"
keynames="${EVDOCKER_KEY_NAMES:?EVDOCKER_KEY_NAMES not set}"

umask 077
mkdir -p "$keysdir"
chmod 700 "$keysdir"
trap 'rm -f "$keysdir"/.tmpkey.*' EXIT

# genkey <name> <bits>  -> <name>.pk8 (pkcs8 DER) + <name>.x509.pem
genkey() {
  local name=$1 bits=$2
  local tmp
  tmp=$(mktemp "$keysdir/.tmpkey.XXXXXX")
  openssl genrsa -out "$tmp" "$bits" 2>/dev/null
  openssl req -new -x509 -sha256 -key "$tmp" -days 10000 \
    -subj "$subject" -out "$keysdir/$name.x509.pem"
  # pk8 is written last, its presence marks the key as complete
  openssl pkcs8 -in "$tmp" -topk8 -outform DER -nocrypt -out "$keysdir/$name.pk8"
}

# regular keys
for name in $keynames; do
  if [ -f "$keysdir/$name.pk8" ]; then
    continue
  fi
  echo "generating key $name"
  genkey "$name" 2048
done

# testkey is just releasekey
ln -sf releasekey.pk8 "$keysdir/testkey.pk8"
ln -sf releasekey.x509.pem "$keysdir/testkey.x509.pem"

# apex keys (only 4096 bit keys are allowed for APEX)
for apex in "$@"; do
  if [ -f "$keysdir/$apex.pk8" ] && [ -f "$keysdir/$apex.pem" ]; then
    continue
  fi
  echo "generating apex key $apex"
  genkey "$apex" 4096
  openssl pkcs8 -in "$keysdir/$apex.pk8" -inform DER -nocrypt -out "$keysdir/$apex.pem"
done

if [ "$EVDOCKER_GEN_AVB" == "1" ]; then
  if [ ! -f "$keysdir/avb.pem" ]; then
    lineagedir="${EVDOCKER_LINEAGEDIR:?EVDOCKER_LINEAGEDIR not set}"
    echo "generating avb key"
    openssl genrsa 4096 2>/dev/null | openssl pkcs8 -topk8 -scrypt -nocrypt -out "$keysdir/avb.pem"
    "$lineagedir/external/avb/avbtool.py" extract_public_key \
      --key "$keysdir/avb.pem" --output "$keysdir/avb_pkmd.bin"
  fi
fi

echo "keys are in $keysdir (BACK THEM UP, losing them means no more updates)"
