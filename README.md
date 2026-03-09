# One-Command Ubuntu GCC/G++ Toolchain Setup

## Repository Purpose
This repository provides `config.sh` for Ubuntu and other `apt`-based systems. The script installs multiple native GCC/G++ versions together with several cross toolchains, then registers them with `update-alternatives` so the active compiler version is easy to inspect and switch.

## Supported Environment
- Ubuntu or another Debian-family distribution with `apt`
- `sudo` access
- Reachable package repositories for all requested compiler packages
- `/bin/bash` and `update-alternatives`

The script does not implement support for non-`apt` distributions.

## What `config.sh` Does
When you run `config.sh`, it performs the following steps:

1. Runs `sudo apt update`
2. Loops through compiler versions `9`, `10`, `11`, and `12`
3. Before each version, waits for a key press and continues automatically after 60 seconds
4. Installs the native compiler pair and four cross toolchain pairs for that version
5. Registers native and cross compiler commands with `update-alternatives`
6. Exits immediately if any `apt install` or `update-alternatives --install` command fails

The `update-alternatives` priority for each entry matches the compiler version number (`9`, `10`, `11`, `12`).

## Quick Start
```bash
chmod +x config.sh
./config.sh
```

If you prefer, you can also run it explicitly with Bash:

```bash
bash config.sh
```

## Installed Scope

### Native Toolchains
For each version `9`, `10`, `11`, and `12`, the script installs:

- `gcc-<version>`
- `g++-<version>`

It then registers the following native alternatives:

- `gcc`
- `g++`
- `gcov`

### Cross Toolchains
For each version `9`, `10`, `11`, and `12`, the script installs these targets:

| Target | Installed package pattern |
| --- | --- |
| `i686-linux-gnu` | `gcc-<version>-i686-linux-gnu`, `g++-<version>-i686-linux-gnu` |
| `aarch64-linux-gnu` | `gcc-<version>-aarch64-linux-gnu`, `g++-<version>-aarch64-linux-gnu` |
| `arm-linux-gnueabi` | `gcc-<version>-arm-linux-gnueabi`, `g++-<version>-arm-linux-gnueabi` |
| `arm-linux-gnueabihf` | `gcc-<version>-arm-linux-gnueabihf`, `g++-<version>-arm-linux-gnueabihf` |

For each target, the script registers these alternatives:

- `<target>-gcc`
- `<target>-g++`
- `<target>-gcov`

## Switching Active Compiler Versions
Use `update-alternatives --config` to select the active version for native or cross compilers:

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config gcov

sudo update-alternatives --config i686-linux-gnu-gcc
sudo update-alternatives --config aarch64-linux-gnu-gcc
sudo update-alternatives --config arm-linux-gnueabi-gcc
sudo update-alternatives --config arm-linux-gnueabihf-gcc
```

To inspect the registered choices and priorities:

```bash
update-alternatives --display gcc
update-alternatives --display aarch64-linux-gnu-gcc
```

## Verification
After the script completes, verify both native and cross toolchains:

```bash
gcc --version
g++ --version
gcov --version

i686-linux-gnu-gcc --version
aarch64-linux-gnu-gcc --version
arm-linux-gnueabi-gcc --version
arm-linux-gnueabihf-gcc --version
```

Check the registered alternatives:

```bash
update-alternatives --display gcc
update-alternatives --display g++
update-alternatives --display aarch64-linux-gnu-gcc
```

Compile a native test program:

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF

gcc hello.c -o hello
./hello
```

Compile the same source to cross-object files:

```bash
i686-linux-gnu-gcc -c hello.c -o hello.i686.o
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
arm-linux-gnueabi-gcc -c hello.c -o hello.armel.o
arm-linux-gnueabihf-gcc -c hello.c -o hello.armhf.o
```

## Notes and Limitations
- The script always runs `sudo apt update` before installation.
- The script is interactive: it pauses before each compiler version and resumes after 60 seconds if no key is pressed.
- The script does not remove old toolchains or old `update-alternatives` entries.
- Re-running the script repeats the same install and registration commands; review the output if your system already contains some entries.
- Successful execution depends on your distribution providing all listed package names for versions `9` through `12`.
