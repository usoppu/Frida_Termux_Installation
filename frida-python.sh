#!/usr/bin/env bash
if ! command -v termux-setup-storage &>/dev/null; then
  echo "This script can be executed only on Termux"
  exit 1
fi

# Detect architecture
case "$(uname -m)" in
    aarch64)
        arch="arm64"
        ;;
    armv7l | armv8l)
        arch="arm"
        ;;
    x86_64)
        arch="x86_64"
        ;;
    x86)
        arch="x86"
        ;;
    *)
        echo "System architecture not recognized: $(uname -m)"
        exit 1
        ;;
esac

cd $TMPDIR

# Update and install required packages
apt update && pkg upgrade -y
pkg i -y python git curl && pip install -U setuptools

# Fetch latest Frida version
#FRIDA_VERSION=$(curl -s https://api.github.com/repos/Alexjr2/Frida_Termux_Installation/releases/latest | grep -oP '"tag_name":\s*"\K[^"]+')
FRIDA_VERSION=16.7.19

# Download Frida devkit
#           https://github.com/Alexjr2/Frida_Termux_Installation/releases/download/16.7.9/frida-gum-devkit-android-x86.tar.xz
DEVKIT_URL="https://github.com/usoppu/Frida_Termux_Installation/releases/download/16.7.9/frida-core-devkit-android-$arch.tar.xz"
DEVKIT_FILE="frida-core-devkit-android-$arch.tar.xz"

curl -L -o "$DEVKIT_FILE" "$DEVKIT_URL"

# Extract devkit
mkdir -p devkit && tar -xJvf "$DEVKIT_FILE" -C devkit

# Clone and install Frida Python
git clone -b 16.7.19 --depth 1 https://github.com/frida/frida-python.git

# fix setup.py
cd frida-python
# https://raw.githubusercontent.com/Alexjr2/Frida_Termux_Installation/refs/heads/main/frida-python.patch
curl -LO https://raw.githubusercontent.com/usoppu/Frida_Termux_Installation/refs/heads/main/frida-python.patch
patch -p1 < frida-python.patch

#install frida-python
FRIDA_VERSION="$FRIDA_VERSION" FRIDA_CORE_DEVKIT="$PWD/../devkit" pip install --force-reinstall .
