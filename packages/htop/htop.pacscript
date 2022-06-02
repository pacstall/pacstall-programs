name="htop"
pkgname="htop"
version="3.2.0"
url="https://github.com/htop-dev/htop/archive/refs/tags/${version}.tar.gz"
build_depends="dh-autoreconf"
depends="libncurses5-dev libncursesw5-dev"
replace="htop"
description="htop is a cross-platform interactive process viewer."
hash="1a1dd174cc828521fe5fd0e052cff8c30aa50809cf80d3ce3a481c37d476ac54"
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
