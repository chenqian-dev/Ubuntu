# Ubuntu 编译器配置脚本

This repository provides a helper script to install and configure multiple
GCC/G++ toolchains on Ubuntu.

## Included Script

- `config.sh`: Installs GCC/G++ versions 9 and 11, plus several cross-compiler
  targets, then registers them with `update-alternatives`.

## Toolchains Installed

- Native: `gcc-9`, `g++-9`, `gcc-11`, `g++-11`
- Cross targets:
  - `i686-linux-gnu`
  - `aarch64-linux-gnu`
  - `arm-linux-gnueabi`
  - `arm-linux-gnueabihf`

## Usage

```bash
chmod +x config.sh
./config.sh
```

The script prompts before each compiler version installation and waits up to
60 seconds for input.

## Requirements

- Ubuntu or another apt-based distribution
- `sudo` privileges

## Selecting Default Compiler

After installation, you can switch compiler versions with:

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```
