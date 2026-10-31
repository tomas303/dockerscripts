#!/bin/bash
set -Eeo pipefail

################################################################################
# build lineage with own keys: lunch + mka target-files-package otatools,      #
# sign target files and create sideloadable OTA zip                            #
# (use instead of 'mka bacon'; run 'repo sync' yourself beforehand)            #
#                                                                              #
# configuration (environment variables, all set in droidenv.sh):               #
#   EVDOCKER_LINEAGEDIR       lineage source tree                              #
#   EVDOCKER_KEYSDIR          keys directory (created by genkeys.sh)           #
#   EVDOCKER_OUTDIR           where signed results are copied                  #
#   EVDOCKER_LUNCH_TARGET     e.g. lineage_toco-userdebug                      #
#   EVDOCKER_OTA_KEY          key name used to sign OTA (default releasekey)   #
#   EVDOCKER_SIGN_EXTRA_ARGS  extra args for sign_target_files_apks            #
#   EVDOCKER_OTA_EXTRA_ARGS   extra args for ota_from_target_files             #
#   EVDOCKER_MKA_JOBS         optional -j value for mka                        #
################################################################################

lineagedir="${EVDOCKER_LINEAGEDIR:?EVDOCKER_LINEAGEDIR not set (login shell?)}"
keysdir="${EVDOCKER_KEYSDIR:?EVDOCKER_KEYSDIR not set}"
outdir="${EVDOCKER_OUTDIR:?EVDOCKER_OUTDIR not set}"
target="${EVDOCKER_LUNCH_TARGET:?EVDOCKER_LUNCH_TARGET not set}"
otakey="${EVDOCKER_OTA_KEY:-releasekey}"

cd "$lineagedir"

# envsetup is not compatible with 'set -u'
source build/envsetup.sh
lunch "$target"

jobs=()
if [ -n "$EVDOCKER_MKA_JOBS" ]; then
  jobs=(-j"$EVDOCKER_MKA_JOBS")
fi
mka "${jobs[@]}" target-files-package otatools

mkdir -p "$outdir"
targetfiles=$(ls -t "$ANDROID_PRODUCT_OUT"/obj/PACKAGING/target_files_intermediates/*-target_files*.zip | head -n1)
signed="$outdir/signed-target_files.zip"
ota="$outdir/signed-ota_update.zip"

export PATH="$lineagedir/out/host/linux-x86/bin:$PATH"

# regular keys + per-APEX keys (APEX list differs between lineage versions,
# so it is discovered from the build)
apexes=$(unzip -Z1 "$targetfiles" | grep -E '\.c?apex$' | xargs -r -n1 basename | sort -u || true)
apexnames=()
apexargs=()
for apexfile in $apexes; do
  name="${apexfile%.*}"
  apexnames+=("$name")
  apexargs+=(--extra_apks "$apexfile=$keysdir/$name"
             --extra_apex_payload_key "$apexfile=$keysdir/$name.pem")
done
"$(dirname "$0")/genkeys.sh" "${apexnames[@]}"

sign_target_files_apks -o -d "$keysdir" "${apexargs[@]}" \
  $EVDOCKER_SIGN_EXTRA_ARGS "$targetfiles" "$signed"

ota_from_target_files -k "$keysdir/$otakey" --block --backup=true \
  $EVDOCKER_OTA_EXTRA_ARGS "$signed" "$ota"

# recovery signed with own keys, needed for the first flash (fastboot)
unzip -o -j "$signed" IMAGES/recovery.img -d "$outdir" || true

echo "signed ota (adb sideload): $ota"
echo "signed target files:       $signed"
ls "$outdir/recovery.img" 2>/dev/null || true
