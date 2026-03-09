# One-Command Ubuntu GCC/G++ Toolchain Setup

## Repository Purpose
This repository provides `config.sh` for Ubuntu and other `apt`-based systems. The script installs GCC/G++ versions `9`, `10`, `11`, and `12`, installs a fixed set of cross toolchains for each version, and registers them with `update-alternatives` so the active compiler can be switched consistently.

## Requirements
- Ubuntu or another distribution with `apt`
- `sudo` privileges
- Reachable package sources for the GCC packages used by the script

## Quick Start
```bash
chmod +x config.sh
./config.sh
```

When you run the script, it will:
1. Run `sudo apt update`
2. Loop through GCC versions `9`, `10`, `11`, and `12`
3. Before each version, wait for keyboard input and continue automatically after 60 seconds
4. Install the configured local and cross compiler packages
5. Register compiler commands with `update-alternatives`

## Installed Scope

### Local compiler versions
- `gcc-9`, `g++-9`
- `gcc-10`, `g++-10`
- `gcc-11`, `g++-11`
- `gcc-12`, `g++-12`

### Cross toolchain targets
The script installs the following target prefixes for each version `9`, `10`, `11`, and `12`:
- `i686-linux-gnu`
- `aarch64-linux-gnu`
- `arm-linux-gnueabi`
- `arm-linux-gnueabihf`

## Registered Alternatives

The script registers the following `update-alternatives` entries:

- Native primary command: `gcc`
- Native slave commands: `g++`, `gcov`
- Cross primary commands: `i686-linux-gnu-gcc`, `aarch64-linux-gnu-gcc`, `arm-linux-gnueabi-gcc`, `arm-linux-gnueabihf-gcc`
- Cross slave commands for each target: `<target>-g++`, `<target>-gcov`

## Switch Commands
Use `update-alternatives --config` to select the active compiler version:

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config gcov
sudo update-alternatives --config aarch64-linux-gnu-gcc
sudo update-alternatives --config arm-linux-gnueabihf-gcc
```

## Verification
Check the active compiler registrations and versions:

```bash
gcc --version
g++ --version
gcov --version
aarch64-linux-gnu-gcc --version
update-alternatives --display gcc
update-alternatives --display aarch64-linux-gnu-gcc
```

Verify native compilation and cross compilation:

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF

gcc hello.c -o hello && ./hello
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
file hello.aarch64.o
```

## Notes
- The script only supports systems where the package names used in `config.sh` are available through `apt`.
- Some repositories may not provide every `gcc-<version>-<target>` package referenced by the script.
- If any `apt install` or `update-alternatives --install` command fails, the script exits immediately with status `1`.
- Cross toolchains are best validated by compiling objects or binaries; running the resulting target binaries usually requires a matching runtime environment or emulator.
