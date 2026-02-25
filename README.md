# Ubuntu GCC/G++ 多版本与交叉编译工具链配置

本仓库提供 `config.sh`，用于在 Ubuntu（或其他基于 `apt` 的发行版）上批量安装并注册 GCC/G++ 9、11 版本及常见交叉编译工具链。

## 功能概览

- 安装本地编译器：`gcc-9`、`g++-9`、`gcc-11`、`g++-11`
- 安装交叉编译器（含对应 `g++`）：
  - `i686-linux-gnu`
  - `aarch64-linux-gnu`
  - `arm-linux-gnueabi`
  - `arm-linux-gnueabihf`
- 使用 `update-alternatives` 注册以下命令的多版本切换：
  - `gcc` / `g++` / `gcov`
  - `i686-linux-gnu-gcc` / `i686-linux-gnu-g++` / `i686-linux-gnu-gcov`
  - `aarch64-linux-gnu-gcc` / `aarch64-linux-gnu-g++` / `aarch64-linux-gnu-gcov`
  - `arm-linux-gnueabi-gcc` / `arm-linux-gnueabi-g++` / `arm-linux-gnueabi-gcov`
  - `arm-linux-gnueabihf-gcc` / `arm-linux-gnueabihf-g++` / `arm-linux-gnueabihf-gcov`

## 环境要求

- Ubuntu 或其他基于 `apt` 的 Linux 发行版
- 已配置可用的软件源和网络连接
- 具备 `sudo` 权限

## 使用方法

```bash
chmod +x config.sh
./config.sh
```

脚本执行流程说明：
- 会先运行 `sudo apt update`
- 按版本 `9`、`11` 依次安装
- 每轮安装前会提示 `Press any key for start install`，并等待最多 60 秒

## 安装后验证

```bash
gcc --version
g++ --version
i686-linux-gnu-gcc --version
aarch64-linux-gnu-gcc --version
arm-linux-gnueabi-gcc --version
arm-linux-gnueabihf-gcc --version
```

## 切换默认版本

本地编译器：

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```

交叉编译器（按需执行）：

```bash
sudo update-alternatives --config i686-linux-gnu-gcc
sudo update-alternatives --config aarch64-linux-gnu-gcc
sudo update-alternatives --config arm-linux-gnueabi-gcc
sudo update-alternatives --config arm-linux-gnueabihf-gcc
```
