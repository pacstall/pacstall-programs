name="rhino-pkg-git"
url="https://github.com/rhino-linux/rhino-pkg.git"
pkgver="0.1.2"
gives="rhino-pkg"
makedepends=("make" "gettext")
depends=("gettext")
pkgdesc="Rhino-pkg wrapper script"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo DESTDIR="${pkgdir}" make install
}

post_install() {
  sudo ln -sf "/usr/bin/rhino-pkg" "/usr/bin/rpk"
}

post_remove() {
  sudo rm -f "/usr/bin/rpk"
}
