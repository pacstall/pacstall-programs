pkgname="github-cli-bin"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="2.72.0"
source=("@${pkgname}~${pkgver}::https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz")
pkgdesc="GitHub's official command line tool - Binary version"
sha256sums=("ffd3a9791075cf6119531302b06554e658f38ed12675a7fbfbf4d6b114c77f38")
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
