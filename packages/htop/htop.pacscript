name="htop"
pkgname="htop"
version="3.0.5"
url="https://github.com/htop-dev/htop/archive/refs/tags/3.0.5.tar.gz"
build_depends="dh-autoreconf"
depends="libncurses5-dev libncursesw5-dev"
breaks=""
description=“htop is a cross-platform interactive process viewer.”
hash="4c2629bd50895bd24082ba2f81f8c972348aa2298cc6edc6a21a7fa18b73990c"
removescript="no"
optdepends=""
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
prepare() {
    sudo mkdir /usr/src/pacstall/htop
    ./autogen.sh
    ./configure
}

build() {
   sudo make
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/htop
    mv htop.desktop /usr/src/pacstall/htop/usr/share/applications
}
