# Ubuntu 编译器配置脚本

本仓库提供了一个辅助脚本，用于在 Ubuntu 上安装并配置多个 GCC/G++ 工具链。

## 包含脚本

- `config.sh`：安装 GCC/G++ 9 和 11 版本，以及多个交叉编译目标，并通过 `update-alternatives` 进行注册。

## 安装的工具链

- 本地编译器：`gcc-9`、`g++-9`、`gcc-11`、`g++-11`
- 交叉编译目标：
  - `i686-linux-gnu`
  - `aarch64-linux-gnu`
  - `arm-linux-gnueabi`
  - `arm-linux-gnueabihf`

## 使用方法

```bash
chmod +x config.sh
./config.sh
```

脚本会在安装每个编译器版本前进行提示，并最多等待 60 秒输入。

## 环境要求

- Ubuntu 或其他基于 apt 的发行版
- 具备 `sudo` 权限

## 选择默认编译器

安装完成后，可通过以下命令切换默认编译器版本：

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```
