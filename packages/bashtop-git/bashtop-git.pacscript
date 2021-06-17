name="bashtop-git"
pkgname="bashtop"
url="https://github.com/aristocratos/bashtop.git"
depends="sed coreutils grep gawk procps python3 python3-distutils lm-sensors sysstat curl"
description="Linux/OSX/FreeBSD resource monitor."
hash="8f12a1f82a1d2971a3470d8f946d21424e3db95edf2aee71d4239841ac304bc8"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
removescript="yes"
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
    sudo make install DESTDIR=/usr/src/pacstall/$name
    sudo install -Dm644 LICENSE /usr/src/pacstall/$name/usr/share/licenses/$pkgname
    sudo install -Dm644 README.md /usr/src/pacstall/$name/usr/share/doc/$pkgname
}

removescript() {
    sudo rm -rf /usr/share/licenses/$pkgname
    sudo rm -rf /usr/share/doc/$pkgname
}
