pkgname="github-cli-bin"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replaces=("${gives}")
repology=("project: github-cli")
pkgver="2.96.0"
source=("@${pkgname}~${pkgver}::https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz")
pkgdesc="GitHub's official command line tool - Binary version"
sha256sums=("83d5c2ccad5498f58bf6368acb1ab32588cf43ab3a4b1c301bf36328b1c8bd60")
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
