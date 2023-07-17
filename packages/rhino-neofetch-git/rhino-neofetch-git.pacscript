name="rhino-neofetch-git"
url="https://github.com/oklopfer/neofetch-rhino.git"
gives="rhino-neofetch"
provides=('neofetch')
replace=("neofetch")
description="neofetch branded for Rhino Linux"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

package() {
  sudo DESTDIR="${pkgdir}" make install
}
