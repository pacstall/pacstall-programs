pkgname="github-cli-bin"
gives="github-cli"
breaks=("${gives}-git" "${gives}-deb")
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="2.42.1"
source=("https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz")
pkgdesc="GitHub's official command line tool - Binary version"
sha256sums=("c82c865545549131f284bf4df73c03c63971a87286fce5ab5d11c9dc0cee2cbb")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  # Binary
  mkdir -p "${pkgdir}/usr/bin"
  mv "./bin/gh" "${pkgdir}/usr/bin"
  # Man
  mkdir -p "${pkgdir}/usr/share/man/man1"
  mv "./share/man/man1" "${pkgdir}/usr/share/man"
}

# vim:set ft=sh ts=2 sw=2 et:
