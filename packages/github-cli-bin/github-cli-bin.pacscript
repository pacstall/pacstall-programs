pkgname="github-cli-bin"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="2.87.2"
source=("@${pkgname}~${pkgver}::https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz")
pkgdesc="GitHub's official command line tool - Binary version"
sha256sums=("18360b2243e3bf9c1457035db45f6400ae4cf957dcc2f674e69717b4e0b14d55")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  # Binary
  mkdir -p "${pkgdir}/usr/bin"
  mv "./bin/gh" "${pkgdir}/usr/bin"
  # Man
  mkdir -p "${pkgdir}/usr/share/man/man1"
  mv "./share/man/man1" "${pkgdir}/usr/share/man"
}

# vim:set ft=sh ts=2 sw=2 et:
