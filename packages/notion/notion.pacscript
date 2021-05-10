name="notion"
pkgname="notion"
version="4.0.2"
description="The notion window manager"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/raboof/notion.git"
depends="build-essential lua5.1 liblua5.1-0-dev libx11-dev libxext-dev libsm-dev gettext libxinerama-dev libxrandr-dev libxft-dev"
gives="notion"
breaks=""

prepare() {
    true
}

build() {
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/notion
}
