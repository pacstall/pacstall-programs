name="bpytop-git"
pkgname="bpytop"
url="https://github.com/aristocratos/$pkgname.git"
build_depends="make"
depends="python3 python3-pip python3-distutils"
description="Linux/OSX/FreeBSD resource monitor."
hash="9ee4aff7dd84b5475401793b925530c3cfad15c9bb3b4b73c9e875daf919d66c"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"
removescript="yes"

prepare() {
    sudo pip3 install psutil
}

build() {
   true
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/$name
    sudo install -Dm644 LICENSE -t /usr/src/pacstall/$name/usr/share/licenses/$pkgname
    sudo install -Dm644 README.md -t /usr/src/pacstall/$name/usr/share/doc/$pkgname
}

removescript() {
    sudo rm -rf /usr/share/licenses/$pkgname
    sudo rm -rf /usr/share/doc/$pkgname
}
