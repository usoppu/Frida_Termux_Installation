> [!NOTE]
> Only For Termux User (Android) support arm, arm64, x86 and x86_64

## Installing Python
```bash
apt update && apt upgrade && apt install build-essential python python-pip git wget binutils openssl && pip install -U setuptools wheel && pip cache purge
```
## Installing frida
```
cd $TMPDIR && wget https://raw.githubusercontent.com/usoppu/Frida_Termux_Installation/refs/heads/main/frida-python.sh && bash frida-python.sh && cd && pip install -U frida-tools --no-deps && pip cache purge
```
## Installing dependancies
```
apt install colorama prompt_toolkit pygments tsu android-tools
```
## test
```
tsu
frida Termux
frida -f com.color.block.jam3d.candy.jelly -l /sdcard/Download/blockout.js //failed
frida 'Block Out Master: Color Jam 3d' -l /sdcard/Download/blockout.js
sudo frida -f com.fc.bus.away.traffic.jam -l /sdcard/Download/traffic.js
```
## maybe not this ------------- add export for su user
```
su
export PATH="$HOME/data/data/com.termux/files/usr/bin:$PATH"
frida --version
```
# Credits
- [frida](https://github.com/frida/frida) : Official Frida Repository
- [frida-python](https://github.com/frida/frida-python.git) : For frida-python installation and script
