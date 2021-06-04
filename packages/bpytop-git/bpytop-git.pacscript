name="bpytop-git"
pkgname="bpytop-git"
version="1.0.65"
url="https://github.com/aristocratos/bpytop.git"
build_depends=""
depends="python3 python3-pip python3-distutils"
breaks=""
description="Linux/OSX/FreeBSD resource monitor."
hash="9ee4aff7dd84b5475401793b925530c3cfad15c9bb3b4b73c9e875daf919d66c"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
prepare() {
    true
}

build() {
   true
}

install() {
    pip3 install psutil
    sudo make install DESTDIR=/usr/src/pacstall/bpytop-git
} 
