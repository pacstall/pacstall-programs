pkgname="pacstall-qa-git"
source=("git+https://github.com/pacstall/pacstall-qa")
arch=("all")
pkgver="0.0.1"
gives="pacstall-qa"
makedepends=("make")
pacdeps=("nushell-bin")
pkgdesc="A tool to easily test pacscripts from PRs locally"
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "pacstall-qa"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/pacstall-qa"
}

package() {
  cd "pacstall-qa"
  DESTDIR="${pkgdir}" make install
}
