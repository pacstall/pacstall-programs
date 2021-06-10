name="bashtop-git"
pkgname="bashtop-git"
url="https://github.com/aristocratos/bashtop.git"
build_depends=""
depends="sed coreutils grep gawk procps python3 python3-distutils lm-sensors sysstat curl"
breaks=""
description="Linux/OSX/FreeBSD resource monitor."
hash="8f12a1f82a1d2971a3470d8f946d21424e3db95edf2aee71d4239841ac304bc8"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    true
}

build() {
   true
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/bashtop-git
}
