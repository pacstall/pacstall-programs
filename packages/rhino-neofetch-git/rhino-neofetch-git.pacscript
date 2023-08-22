name="rhino-neofetch-git"
url="https://github.com/rhino-linux/neofetch.git"
pkgver="0.0.1"
gives="rhino-neofetch"
provides=('neofetch')
replace=("neofetch")
breaks=("neofetch")
mask=("neofetch")
pkgdesc="neofetch branded for Rhino Linux"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo DESTDIR="${pkgdir}" make install
}
