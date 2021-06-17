name="bpytop-git"
pkgname="bpytop-git"
url="https://github.com/aristocratos/bpytop.git"
build_depends=""
depends="python3 python3-pip python3-distutils"
breaks=""
description="Linux/OSX/FreeBSD resource monitor."
hash="9ee4aff7dd84b5475401793b925530c3cfad15c9bb3b4b73c9e875daf919d66c"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    sudo pip3 install psutil
}

build() {
   true
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/bpytop-git
} 
