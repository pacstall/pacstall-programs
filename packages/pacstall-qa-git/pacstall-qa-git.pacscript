name="pacstall-qa-git"
url="https://github.com/pacstall/pacstall-qa"
pkgver="0.0.1"
gives="pacstall-qa"
makedepends=("make")
pacdeps=("nushell-bin")
pkgdesc="A tool to easily test pacscripts from PRs locally"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mkdir -p "${pkgdir}/usr/share/pacstall-qa"

package() {
  sudo DESTDIR="${pkgdir}" make install
}
