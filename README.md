> [!NOTE]
> Only For Termux User (Android) support arm, arm64, x86 and x86_64

## Installing Python
```bash
apt update && apt upgrade && apt install build-essential python python-pip git wget binutils openssl && pip install -U setuptools wheel && pip cache purge
```
## Installing frida
```
cd $TMPDIR && wget https://raw.githubusercontent.com/Alexjr2/Frida_Termux_Installation/refs/heads/main/frida-python.sh && bash frida-python.sh && cd && pip install -U frida-tools && pip cache purge
```
# Credits
- [frida](https://github.com/frida/frida) : Official Frida Repository
- [frida-python](https://github.com/frida/frida-python/tree/ebd797e4bc248b8d895d68ebf244a34744cb3ea9) : For frida-python installation and script
