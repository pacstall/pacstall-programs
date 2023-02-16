name="rhino-pkg-git"
url="https://github.com/rhino-linux/rhino-pkg.git"
gives="rhino-pkg"
build_depends="make gettext"
depends="gettext"
description="Rhino-pkg wrapper script"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="0.0.2-$(pkgver)"

install() {
    sudo DESTDIR="${pkgdir}" make install
}
