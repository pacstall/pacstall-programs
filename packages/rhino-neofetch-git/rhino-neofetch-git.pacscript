pkgname="rhino-neofetch-git"
source=("https://github.com/rhino-linux/neofetch.git")
pkgver="0.0.1"
gives="rhino-neofetch"
provides=('neofetch')
replaces=("neofetch")
breaks=("neofetch")
mask=("neofetch")
pkgdesc="neofetch branded for Rhino Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" make install
}
