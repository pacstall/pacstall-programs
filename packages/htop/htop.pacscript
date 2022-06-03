name="htop"
pkgname="htop"
version="3.2.1"
url="https://github.com/htop-dev/htop/archive/refs/tags/${version}.tar.gz"
build_depends="dh-autoreconf"
depends="libncurses5-dev libncursesw5-dev"
replace="htop"
description="htop is a cross-platform interactive process viewer."
hash="b5ffac1949a8daaabcffa659c0964360b5008782aae4dfa7702d2323cfb4f438"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
prepare() {
    ./autogen.sh
    ./configure
}

build() {
   make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/htop
    sudo install -Dm755 htop.desktop -t /usr/src/pacstall/htop/usr/share/applications
}
