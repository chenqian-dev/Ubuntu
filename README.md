# Ubuntu GCC/G++ 工具链一键配置

## 简介

本仓库提供 `config.sh`，用于在 Ubuntu（或其他基于 `apt` 的发行版）上批量安装 GCC/G++ 与常见交叉编译工具链，并通过 `update-alternatives` 统一管理默认版本。

## 安装内容

- GCC/G++ 版本：`9`、`10`、`11`、`12`
- 交叉目标：`i686-linux-gnu`、`aarch64-linux-gnu`、`arm-linux-gnueabi`、`arm-linux-gnueabihf`
- 统一注册：本地 `gcc`/`g++`/`gcov` 与交叉 `<target>-gcc`/`<target>-g++`/`<target>-gcov`

## 快速开始

```bash
chmod +x config.sh
./config.sh
```

脚本会在安装每个版本（9/10/11/12）前等待输入，超时为 60 秒。

## 版本切换

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config aarch64-linux-gnu-gcc
sudo update-alternatives --config aarch64-linux-gnu-g++
```

## 最小验证

1) 版本输出检查：

```bash
gcc --version
g++ --version
aarch64-linux-gnu-gcc --version
```

2) `update-alternatives` 注册检查：

```bash
update-alternatives --display gcc
update-alternatives --display g++
update-alternatives --display aarch64-linux-gnu-gcc
```

3) 最小交叉编译检查（只编译）：

```bash
echo 'int main(void){return 0;}' | aarch64-linux-gnu-gcc -x c - -c -o /tmp/min.aarch64.o
```
