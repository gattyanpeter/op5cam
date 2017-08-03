#!/usr/bin/env bash
VERSION=OOS_Camera_OP5_Flashable_v0.2
zip -0 -ur ${VERSION}.zip . -x ".git/*" "zip.bash" ".gitignore"
