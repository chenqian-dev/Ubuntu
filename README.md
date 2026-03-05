# Ubuntu GCC/G++ 工具链一键配置

## 用途

`config.sh` 用于在 Ubuntu（或其他基于 `apt` 的发行版）批量安装 GCC/G++ 与常见交叉工具链，并通过 `update-alternatives` 统一管理默认版本。

## 一步执行

前置条件：
- 基于 `apt` 的 Linux 发行版
- 可用的 `sudo` 权限
- 可访问软件源的网络环境

执行命令：

```bash
chmod +x config.sh
./config.sh
```

脚本会安装并注册以下版本范围：
- 本地编译器：`gcc-{9,10,11,12}`、`g++-{9,10,11,12}`
- 交叉目标（每个目标均覆盖 `9/10/11/12`）：`i686-linux-gnu`、`aarch64-linux-gnu`、`arm-linux-gnueabi`、`arm-linux-gnueabihf`

交互提示：
- 每轮安装前会出现 `Press any key for start install`
- 等待键盘输入，`60` 秒超时后继续

## 可切换版本

脚本会为本地与交叉命令注册 alternatives（`gcc`/`g++`/`gcov` 以及 `<target>-gcc`/`<target>-g++`/`<target>-gcov`），可按需切换：

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config aarch64-linux-gnu-gcc
```

## 最小验证

```bash
gcc --version
g++ --version
aarch64-linux-gnu-gcc --version
arm-linux-gnueabihf-gcc --version
```
