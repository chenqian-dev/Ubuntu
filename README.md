# Ubuntu GCC/G++ 工具链一键配置

`config.sh` 用于在 Ubuntu（apt 环境）批量安装并注册 GCC/G++ 与常见交叉工具链，统一通过 `update-alternatives` 管理切换。

## 安装内容

- 本地编译器版本：`gcc/g++ 9/10/11/12`
- 交叉目标：`i686-linux-gnu`、`aarch64-linux-gnu`、`arm-linux-gnueabi`、`arm-linux-gnueabihf`（均按 9/10/11/12 安装）
- alternatives 注册项：
  - 本地：`gcc`、`g++`、`gcov`
  - 交叉：`<target>-gcc`、`<target>-g++`、`<target>-gcov`

## 执行步骤

- 前提：有 `sudo` 权限，`apt` 软件源可用

```bash
chmod +x config.sh
./config.sh
```

脚本会在每个版本（9/10/11/12）安装前等待一次键盘输入，`60` 秒超时后继续。

## 常用切换

```bash
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
sudo update-alternatives --config aarch64-linux-gnu-gcc
```

## 最小验证

```bash
gcc --version
aarch64-linux-gnu-gcc --version
update-alternatives --display gcc
```

```bash
cat > hello.c <<'EOF'
#include <stdio.h>
int main(void) { puts("hello"); return 0; }
EOF
gcc hello.c -o hello && ./hello
aarch64-linux-gnu-gcc -c hello.c -o hello.aarch64.o
```
