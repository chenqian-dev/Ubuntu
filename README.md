# Ubuntu GCC/G++ 工具链一键配置

本仓库核心仅有 `config.sh`，用于在 Ubuntu/`apt` 环境安装并注册 GCC/G++ 与交叉工具链。

## 支持范围

- 系统：Ubuntu 或其他支持 `apt` 的 Linux 发行版
- 前置条件：可用 `sudo` 权限、网络可访问软件源
- 本地编译器版本：`gcc/g++-9`、`gcc/g++-10`、`gcc/g++-11`、`gcc/g++-12`
- 交叉目标（每个版本均安装并注册）：`i686-linux-gnu`、`aarch64-linux-gnu`、`arm-linux-gnueabi`、`arm-linux-gnueabihf`
- 通过 `update-alternatives` 注册：本地 `gcc`/`g++`/`gcov` 与交叉 `<target>-gcc`/`<target>-g++`/`<target>-gcov`

## 快速使用

```bash
chmod +x config.sh
./config.sh
```

脚本会调用 `sudo apt update` 与 `apt install`，并在安装每个版本（9/10/11/12）前暂停等待输入（默认 60 秒超时）。

## 切换默认版本

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config aarch64-linux-gnu-gcc
sudo update-alternatives --config aarch64-linux-gnu-g++
```

## 最小验证

```bash
gcc --version
g++ --version
aarch64-linux-gnu-gcc --version
```

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF
gcc hello.c -o hello && ./hello
```

```bash
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
```
