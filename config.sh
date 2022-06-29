#! /bin/bash

sudo apt update

# intall compiler
for i in 9 11;
do
echo "######################### install gcc & gcc $i #########################"

read -p "Press any key for start install" -t 60

# install
sudo apt install -y gcc-$i g++-$i || exit 1
sudo apt install -y gcc-$i-i686-linux-gnu g++-$i-i686-linux-gnu || exit 1 
sudo apt install -y gcc-$i-aarch64-linux-gnu g++-$i-aarch64-linux-gnu || exit 1 
sudo apt install -y gcc-$i-arm-linux-gnueabi g++-$i-arm-linux-gnueabi || exit 1 
sudo apt install -y gcc-$i-arm-linux-gnueabihf g++-$i-arm-linux-gnueabihf || exit 1 

# config
sudo update-alternatives --install \
    /usr/bin/gcc gcc /usr/bin/gcc-$i $i \
    --slave /usr/bin/g++ g++ /usr/bin/g++-$i \
    --slave /usr/bin/gcov gcov /usr/bin/gcov-$i || exit 1
sudo update-alternatives --install \
    /usr/bin/i686-linux-gnu-gcc i686-linux-gnu-gcc /usr/bin/i686-linux-gnu-gcc-$i $i \
    --slave /usr/bin/i686-linux-gnu-g++ i686-linux-gnu-g++ /usr/bin/i686-linux-gnu-g++-$i \
    --slave /usr/bin/i686-linux-gnu-gcov i686-linux-gnu-gcov /usr/bin/i686-linux-gnu-gcov-$i || exit 1
sudo update-alternatives --install \
    /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-$i $i \
    --slave /usr/bin/aarch64-linux-gnu-g++ aarch64-linux-gnu-g++ /usr/bin/aarch64-linux-gnu-g++-$i \
    --slave /usr/bin/aarch64-linux-gnu-gcov aarch64-linux-gnu-gcov /usr/bin/aarch64-linux-gnu-gcov-$i || exit 1
sudo update-alternatives --install \
    /usr/bin/arm-linux-gnueabi-gcc arm-linux-gnueabi-gcc /usr/bin/arm-linux-gnueabi-gcc-$i $i \
    --slave /usr/bin/arm-linux-gnueabi-g++ arm-linux-gnueabi-g++ /usr/bin/arm-linux-gnueabi-g++-$i \
    --slave /usr/bin/arm-linux-gnueabi-gcov arm-linux-gnueabi-gcov /usr/bin/arm-linux-gnueabi-gcov-$i || exit 1
sudo update-alternatives --install \
    /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-$i $i \
    --slave /usr/bin/arm-linux-gnueabihf-g++ arm-linux-gnueabihf-g++ /usr/bin/arm-linux-gnueabihf-g++-$i \
    --slave /usr/bin/arm-linux-gnueabihf-gcov arm-linux-gnueabihf-gcov /usr/bin/arm-linux-gnueabihf-gcov-$i || exit 1
done