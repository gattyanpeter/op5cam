#!/sbin/sh
# 
# /system/addon.d/50-cm.sh
# During a LineageOS 14.1 upgrade, this script backs up /system/etc/hosts,
# /system is formatted and reinstalled, then the file is restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
bin/secure_camera_sample_client
framework/org.ifaa.android.manager.jar
lib/libfilter-sdk.so
lib/libopbaselib.so
lib64/libfilter-sdk.so
lib64/libopbaselib.so
lib64/libopcamera.so
lib64/libopcameralib.so
priv-app/OnePlusCamera/lib/arm64/libopbaselib.so
priv-app/OnePlusCamera/lib/arm64/libopcamera.so
priv-app/OnePlusCamera/lib/arm64/libopcameralib.so
priv-app/OnePlusCamera/OnePlusCamera.apk
priv-app/OnePlusCameraService/OnePlusCameraService.apk
vendor/lib/lib-imscamera.so
vendor/lib/libimscamera_jni.so
vendor/lib/libimsmedia_jni.so
vendor/lib64/lib-imscamera.so
vendor/lib64/libimscamera_jni.so
vendor/lib64/libimsmedia_jni.so
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
