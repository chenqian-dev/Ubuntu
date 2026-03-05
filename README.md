# One-Command Ubuntu GCC/G++ Toolchain Setup

## Repository Purpose
This repository provides `config.sh` to install and register multiple local GCC/G++ versions plus common cross-compilers on Ubuntu or other `apt`-based distributions. It uses `update-alternatives` to keep default compiler selections consistent and easy to switch.

## Quick Start
```bash
chmod +x config.sh
./config.sh
```
Before installing each version (`9`, `10`, `11`, `12`), the script pauses for confirmation and automatically continues after 60 seconds.

## Installed Scope
Installed and registered versions: `9/10/11/12`.
- Local tools: `gcc`, `g++`, `gcov`
- Cross targets: `i686-linux-gnu`, `aarch64-linux-gnu`, `arm-linux-gnueabi`, `arm-linux-gnueabihf` (each includes `gcc/g++/gcov`)
Prerequisites: `apt` package manager, `sudo` privileges, and reachable package mirrors.

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