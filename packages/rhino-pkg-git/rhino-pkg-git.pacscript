name="rhino-pkg-git"
url="https://github.com/rhino-linux/rhino-pkg.git"
gives="rhino-pkg"
build_depends=("make" "gettext")
depends=("gettext")
description="Rhino-pkg wrapper script"
maintainer="Elsie19 <hwengerstickel@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

package() {
  sudo DESTDIR="${pkgdir}" make install
}

postinst() {
  sudo ln -sf "/usr/bin/rhino-pkg" "/usr/bin/rpk"
}

removescript() {
  sudo rm -f "/usr/bin/rpk"
}
