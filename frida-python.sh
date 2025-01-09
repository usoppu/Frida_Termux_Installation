#!/data/data/com.termux/files/usr/bin/sh

if ! command -v termux-setup-storage; then
  echo "This script can be executed only on Termux"
  exit 1
fi

cd $TMPDIR

apt update && pkg upgrade -y

pkg i -y python git && pip install -U setuptools

FRIDA_VERSION=$(curl --silent "https://api.github.com/repos/Alexjr2/Frida_Termux_Installation/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

DEVKIT_URL="https://github.com/Alexjr2/Frida_Termux_Installation/releases/download/$FRIDA_VERSION/frida-core-devkit-android-arm64.tar.xz"

curl -L -o frida-core-devkit-android-arm64.tar.xz "$DEVKIT_URL"

mkdir -p $PWD/devkit && tar -xJvf frida-core-devkit-android-arm64.tar.xz -C $PWD/devkit

git clone https://github.com/AbhiTheModder/frida-python frida-python-android

cd frida-python-android

FRIDA_VERSION="$FRIDA_VERSION" FRIDA_CORE_DEVKIT="$PWD/../devkit" pip install --force-reinstall .
