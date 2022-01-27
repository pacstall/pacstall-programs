name="nano"
major_version="6"
minor_version="0"
version="${major_version}.${minor_version}"
license="GPL3"
url="https://www.nano-editor.org/dist/v${major_version}/${name}-${version}.tar.gz"
build_depends="libncurses-dev groff autoconf make automake autopoint gcc gettext git pkg-config texinfo"
description="GNU Nano"
hash="3c22971432503c0f84e1c0fbe8a04d35acc131034f8a03fdfdbca77a99208e81"

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
