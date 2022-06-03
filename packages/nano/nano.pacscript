name="nano"
major_version="6"
minor_version="3"
version="${major_version}.${minor_version}"
license="GPL3"
url="https://www.nano-editor.org/dist/v${major_version}/${name}-${version}.tar.gz"
build_depends="libncurses-dev groff autoconf make automake autopoint gcc gettext git pkg-config texinfo"
description="GNU Nano"
hash="24c51bb2bddc682f95ae745c743cbceebd836549de66bdfd6af80a40333cc6a7"
repology=("project: nano")

prepare() {
    ./configure
}

build() {
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/nano
}
