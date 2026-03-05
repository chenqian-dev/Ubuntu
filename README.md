# Ubuntu GCC/G++ 工具链一键配置

## 1) 仓库用途
本仓库提供 `config.sh`，用于在 Ubuntu（或其他基于 `apt` 的发行版）一次性安装并注册多版本本地 GCC/G++ 与常用交叉工具链，并通过 `update-alternatives` 统一管理默认版本。

## 2) 安装范围
`config.sh` 安装并注册的版本为 `9/10/11/12`。
- 本地命令：`gcc`、`g++`、`gcov`
- 交叉目标：`i686-linux-gnu`、`aarch64-linux-gnu`、`arm-linux-gnueabi`、`arm-linux-gnueabihf`（对应 `gcc/g++/gcov` 一并注册）

前置条件：系统支持 `apt`、具备 `sudo` 权限、网络可访问软件源。

## 3) 快速使用
```bash
chmod +x config.sh
./config.sh
```
脚本会在每个版本（9、10、11、12）安装前暂停一次等待输入，默认 60 秒超时后继续。

## 4) 常用切换命令
```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config aarch64-linux-gnu-gcc
```

## 5) 最小验证
```bash
gcc --version
aarch64-linux-gnu-gcc --version
update-alternatives --display gcc
printf 'int main(void){return 0;}\n' | gcc -x c - -o /tmp/hello.local && /tmp/hello.local
printf 'int main(void){return 0;}\n' | aarch64-linux-gnu-gcc -x c -c - -o /tmp/hello.aarch64.o
```