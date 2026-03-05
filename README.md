# Ubuntu GCC/G++ 工具链一键配置

本仓库提供 `config.sh`，用于在 Ubuntu（或其他基于 `apt` 的发行版）上批量安装多版本 GCC/G++ 及常见交叉编译工具链，并通过 `update-alternatives` 统一注册/切换。

## 概览

- 版本：`9/10/11/12`（与脚本一致）
- 本地命令：`gcc`、`g++`、`gcov`
- 交叉目标：
  - `i686-linux-gnu`
  - `aarch64-linux-gnu`
  - `arm-linux-gnueabi`
  - `arm-linux-gnueabihf`
- 交叉命令：`<target>-gcc`、`<target>-g++`、`<target>-gcov`

## 使用

前置条件：

- Ubuntu / Debian 系（支持 `apt`）
- 可用的 `sudo` 权限
- 网络可访问软件源（用于 `apt update/apt install`）

运行：

```bash
chmod +x config.sh
./config.sh
```

提示：

- 脚本会在安装每个版本（9、10、11、12）前暂停等待输入，单次最多等待 60 秒后继续。

切换默认版本（示例）：

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config aarch64-linux-gnu-gcc
```

## 验证

查看版本（示例）：

```bash
gcc --version
aarch64-linux-gnu-gcc --version
```

确认 alternatives 注册/指向（示例）：

```bash
update-alternatives --display gcc
update-alternatives --display aarch64-linux-gnu-gcc
```

最小编译自检：

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF

gcc hello.c -o hello && ./hello
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
```
