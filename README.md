# One-Command Ubuntu GCC/G++ Toolchain Setup

## Repository Purpose
This repository provides `config.sh` for Ubuntu or other `apt`-based systems to install local GCC/G++ versions and common cross toolchains. It uses `update-alternatives` to keep compiler selection consistent and easy to switch.

## Quick Start
```bash
chmod +x config.sh
./config.sh
```
Before installing each version (`9`, `10`, `11`, `12`), the script waits for keyboard input and continues automatically after a 60-second timeout.

## Installed Scope
- Local compiler versions: `gcc/g++ 9/10/11/12`
- Cross targets (installed for `9/10/11/12`): `i686-linux-gnu`, `aarch64-linux-gnu`, `arm-linux-gnueabi`, `arm-linux-gnueabihf`
- Registered local alternatives: `gcc`, `g++`, `gcov`
- Registered cross alternatives: `<target>-gcc`, `<target>-g++`, `<target>-gcov`
- Prerequisites: `sudo` privileges and reachable `apt` package sources

## Switch Commands
```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config aarch64-linux-gnu-gcc
```

## Verification
```bash
gcc --version
aarch64-linux-gnu-gcc --version
update-alternatives --display gcc
```

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF

gcc hello.c -o hello && ./hello
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
```
