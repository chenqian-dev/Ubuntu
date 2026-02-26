# Ubuntu GCC/G++ 工具链一键配置

本仓库提供 `config.sh`，用于在 Ubuntu（或其他基于 `apt` 的发行版）上批量安装并注册多版本 GCC/G++ 及常见交叉编译工具链。

## 功能概览

- 安装本地编译器：`gcc-9`、`g++-9`、`gcc-11`、`g++-11`
- 安装交叉编译工具链（9/11 两个版本）：
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

## 快速开始

```bash
chmod +x config.sh
./config.sh
```

执行过程中会在安装每个版本（9 和 11）前等待一次键盘输入，超时为 60 秒。

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

```bash
gcc --version
g++ --version
aarch64-linux-gnu-gcc --version
arm-linux-gnueabihf-gcc --version
```

如果以上命令能输出对应版本信息，说明工具链安装与 alternatives 注册成功。
