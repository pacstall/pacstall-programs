name="notion-git"
pkgname="notion-git"
description="The notion window manager"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/raboof/notion.git"
depends="build-essential lua5.1 liblua5.1-0-dev libx11-dev libxext-dev libsm-dev gettext libxinerama-dev libxrandr-dev libxft-dev"
gives="notion"
breaks="notion"
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    true
}

build() {
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/notion-git
}
