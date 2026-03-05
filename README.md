# Ubuntu GCC/G++ 工具链一键配置

## 用途简介

`config.sh` 用于在 Ubuntu（或其他基于 `apt` 的发行版）上批量安装并注册 GCC/G++ 多版本与常见交叉工具链，并通过 `update-alternatives` 统一管理默认版本。

- 本地编译器版本：`gcc-9`、`g++-9`、`gcc-10`、`g++-10`、`gcc-11`、`g++-11`、`gcc-12`、`g++-12`
- 交叉工具链版本：`i686-linux-gnu`、`aarch64-linux-gnu`、`arm-linux-gnueabi`、`arm-linux-gnueabihf`（均为 `9/10/11/12`）
- 注册命令：本地 `gcc`、`g++`、`gcov`；交叉 `<target>-gcc`、`<target>-g++`、`<target>-gcov`

## 环境要求

- Ubuntu 或其他支持 `apt` 的 Linux 发行版
- 可用的 `sudo` 权限
- 网络可访问软件源

## 快速开始

1. 赋予脚本执行权限：

```bash
chmod +x config.sh
```

2. 执行安装脚本（会调用 `sudo apt update` 和 `apt install`）：

```bash
./config.sh
```

3. 根据提示继续：脚本会在安装每个版本（9、10、11、12）前暂停等待输入（默认 60 秒超时）。

## 版本切换

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config aarch64-linux-gnu-gcc
sudo update-alternatives --config aarch64-linux-gnu-g++
```

其他交叉目标（`i686-linux-gnu`、`arm-linux-gnueabi`、`arm-linux-gnueabihf`）可按相同方式切换。

## 结果验证

1. 版本查看（本地 + 交叉）：

```bash
gcc --version
aarch64-linux-gnu-gcc --version
```

2. 本地最小编译与运行：

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF
gcc hello.c -o hello && ./hello
```

3. 一次交叉编译（仅编译，不运行）：

```bash
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
```
