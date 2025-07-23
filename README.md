> [!NOTE]
> Only For Termux User (Android) support arm64
> Frida version specifically 16.7.19

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
pip install colorama prompt_toolkit pygments
```
## test
```
//frida Termux works
sudo frida 'Block Out Master: Color Jam 3d' -l /sdcard/Download/blockout.js //winner works

doesnt work:
//frida -f com.color.block.jam3d.candy.jelly -l /sdcard/Download/blockout.js //failed
sudo frida -f com.fc.bus.away.traffic.jam -l /sdcard/Download/traffic.js //nop
sudo frida -f "Traffic Escape!" -l /sdcard/Download/traffic.js
```
## additional unnecessaries. tsu for sudo?
```
pkg install tsu android-tools
```
## Check if USAP pool is enabled and try disabling:
```
getprop | grep usap
setprop persist.device_config.runtime_native.usap_pool_enabled false
```
## also try (taba7lite needed this)
```
setenforce 0
```

## run with
```
setenforce 0
```

# Credits
- [frida](https://github.com/frida/frida) : Official Frida Repository
- [frida-python](https://github.com/frida/frida-python.git) : For frida-python installation and script
