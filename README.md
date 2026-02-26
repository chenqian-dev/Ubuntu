# Ubuntu GCC/G++ 工具链一键配置

本仓库提供 `config.sh`，用于在 Ubuntu（或其他基于 `apt` 的发行版）上批量安装并注册多版本 GCC/G++ 及常见交叉编译工具链。

## 功能概览介绍

`config.sh` 面向「一台新装 Ubuntu 主机」的场景：一次性安装 GCC/G++ 多版本与常用交叉编译器，并用 `update-alternatives` 统一管理/切换（无需手工改软链接或环境变量）。

- 安装本地编译器：`gcc-9`、`g++-9`、`gcc-11`、`g++-11`、`gcc-12`、`g++-12`
- 安装交叉编译工具链（9/11/12 三个版本）：
  - `i686-linux-gnu`
  - `aarch64-linux-gnu`
  - `arm-linux-gnueabi`
  - `arm-linux-gnueabihf`
- 使用 `update-alternatives` 统一注册以下命令：
  - 本地：`gcc`、`g++`、`gcov`
  - 交叉：`<target>-gcc`、`<target>-g++`、`<target>-gcov`

## 环境要求

- Ubuntu 或其他支持 `apt` 的 Linux 发行版
- 可用的 `sudo` 权限
- 网络可访问软件源

## 快速开始步骤

1. 赋予脚本执行权限：

```bash
chmod +x config.sh
```

2. 运行安装脚本（脚本内部会调用 `sudo` 执行 `apt update/apt install`）：

```bash
./config.sh
```

3. 根据提示继续：脚本会在安装每个版本（9、11 和 12）前暂停一次等待键盘输入，默认 60 秒超时。

## 安装后常用操作

1. 切换本地默认编译器版本：

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```

2. 如需切换某个交叉目标，也可同样使用：

```bash
sudo update-alternatives --config aarch64-linux-gnu-gcc
sudo update-alternatives --config aarch64-linux-gnu-g++
```

## 验证安装结果

1. 查看版本信息（确认工具链已安装）：

```bash
gcc --version
g++ --version
gcov --version
aarch64-linux-gnu-gcc --version
arm-linux-gnueabihf-gcc --version
```

2. 查看 `update-alternatives` 注册与当前指向（确认 alternatives 已生效）：

```bash
update-alternatives --display gcc
update-alternatives --display g++
update-alternatives --display aarch64-linux-gnu-gcc
```

3. 做一次最小编译/运行自检（本地编译器）：

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF
gcc hello.c -o hello && ./hello
```

4. 做一次最小交叉编译自检（只编译不运行，确认能产物输出）：

```bash
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
arm-linux-gnueabihf-gcc -c hello.c -o hello.armhf.o
```

如果以上步骤都能正常执行，说明工具链安装与 `update-alternatives` 注册成功。
