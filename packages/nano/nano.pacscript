name="nano"
version="5.7"
license="GPL3"
url="https://www.nano-editor.org/dist/v5/nano-5.7.tar.gz"
build_depends="libncurses-dev groff autoconf automake autopoint gcc gettext git make pkg-config texinfo"
depends=""
description="GNU Nano"
hash="cf32085d257cb9379540cddedede207b43eb41e5acedf01132e09cc2c0e4e4f8"

prepare() {
    ./autogen.sh
    ./configure
}

build() {
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/nano
}

