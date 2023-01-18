#! /bin/sh

PADAVAN_PATCHES_DIR=$HOME/Artix_padavan
PADAVAN_REPO_DIR=$HOME/padavan-ng

cd $PADAVAN_REPO_DIR
git clean -dxf 
git reset --hard
git pull
git checkout master

cd toolchain
./build_toolchain.sh

# replace config-template for your needs; here for example Asus RT-N14U is used
cp -v $PADAVAN_REPO_DIR/trunk/configs/templates/asus/rt-n14u.config $PADAVAN_REPO_DIR/trunk/.config

#patches for Artix
patch -i $PADAVAN_PATCHES_DIR/Makefile_util-linux.patch $PADAVAN_REPO_DIR/trunk/user/util-linux/Makefile
patch -i $PADAVAN_PATCHES_DIR/Makefile_libtirpc.patch $PADAVAN_REPO_DIR/trunk/libs/libtirpc/Makefile
#patch -i $PADAVAN_PATCHES_DIR/Makefile_tor.patch $PADAVAN_REPO_DIR/trunk/user/tor/Makefile
patch -i $PADAVAN_PATCHES_DIR/Makefile_libsqlite.patch $PADAVAN_REPO_DIR/trunk/libs/libsqlite/Makefile
patch -i $PADAVAN_PATCHES_DIR/configure.ac_transmission.patch $PADAVAN_REPO_DIR/trunk/user/transmission/transmission-3.0X/configure.ac

cd trunk
./build_firmware.sh
