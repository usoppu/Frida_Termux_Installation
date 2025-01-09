> [!NOTE]
> Only For Termux User (Android) 

## Installing Python
```bash
apt update && apt upgrade && apt install build-essential python python-pip git wget binutils openssl && pip install -U setuptools wheel && pip cache purge
```
## Installing frida
```
cd $TMPDIR && wget https://raw.githubusercontent.com/Alexjr2/Frida_Termux_Installation/refs/heads/main/frida-python.sh && bash frida-python.sh && cd && pip install -U frida-tools && pip cache purge
```
# Credits
- [frida](https://github.com/frida) : Official Frida Repository
- [Abhy](https://github.com/AbhiTheModder) : For frida-python installation and script
