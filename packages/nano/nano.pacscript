name="nano"
major_version="5"
minor_version="8"
version="${major_version}.${minor_version}"
license="GPL3"
url="https://www.nano-editor.org/dist/v${major_version}/${name}-${version}.tar.gz"
build_depends="libncurses-dev groff autoconf automake autopoint gcc gettext git make pkg-config texinfo"
depends=""
description="GNU Nano"
hash="f47c7407d4d7b780c4a8fa20706ebf5740c0df41dc0e521a536916660bc18ec4"

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

