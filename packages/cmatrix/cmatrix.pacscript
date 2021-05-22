name="cmatrix"
pkgname="cmatrix"
version="2.0"
url="https://github.com/abishekvashok/cmatrix/releases/download/v2.0/cmatrix-v2.0-Butterscotch.tar"
build_depends=""
depends=""
breaks=""
replace="cmatrix"
description="terminal based "the matrix" like implementation"
hash="e46c739bfe79e570db2461f89ac66ea79a8fab8efb8423ab53f143e93c2553bc"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
          true
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/cmatrix
}
