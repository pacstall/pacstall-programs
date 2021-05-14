name="git"
pkgname="git"
version="2.31.1"
url="https://github.com/git/git/archive/refs/tags/v2.31.1.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
breaks=""
replace="git-all"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals."
hash="b1c0e95e9861b5d1b9ad3d8deaa2d8c7f02304ffc1b5e8869dd9fb98f9a0d436"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
prepare() {
          make configure
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/git
}
