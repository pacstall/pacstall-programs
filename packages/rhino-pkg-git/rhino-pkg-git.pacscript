name="rhino-pkg-git"
url="https://github.com/rhino-linux/rhino-pkg.git"
gives="rhino-pkg"
build_depends="make gettext"
description="Rhino-pkg wrapper script"
maintainer="Henryws <hwengerstickel@pm.me>"
incompatible=("debian:*")
pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

install() {
    sudo DESTDIR="${pkgdir}" make install
}
