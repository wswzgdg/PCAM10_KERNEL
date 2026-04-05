cd common

#工具链
export PATH=/usr/lib/llvm-22/bin/:$PATH

#验证版本
clang -v
clang++ -v
git -v

# 禁用 Git 信息
touch .scmversion

# 确保 EXTRAVERSION 为空
sed -i 's/^EXTRAVERSION =.*/EXTRAVERSION =/' Makefile

#用户主机名
export KBUILD_BUILD_USER=ZakoBai♡
export KBUILD_BUILD_HOST=XinRan

#构建时间
#export KBUILD_BUILD_TIMESTAMP="Mon Sep 16 14:52:44 UTC 2024"

#生成配置文件
make LLVM=1 LLVM_IAS=1 ARCH=arm64 CC="ccache clang" HOSTCC="ccache clang" HOSTCXX="ccache clang++" CROSS_COMPILE=aarch64-linux-gnu- LD=aarch64-linux-gnu-ld OBJCOPY=aarch64-linux-gnu-objcopy PYTHON=python3 O=out oppo6771_18161_defconfig

#构建
make LLVM=1 LLVM_IAS=1 ARCH=arm64 CC="ccache clang" HOSTCC="ccache clang" HOSTCXX="ccache clang++" CROSS_COMPILE=aarch64-linux-gnu- LD=aarch64-linux-gnu-ld OBJCOPY=aarch64-linux-gnu-objcopy PYTHON=python3 O=out KCFLAGS="-Wno-error -Wno-unused-but-set-variable" -j$(nproc --all)
