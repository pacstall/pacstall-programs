name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replace=("${gives}")
repology=("project: ${pkgname}")
pkgver="2.42.1"
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz"
pkgdesc="GitHub's official command line tool - Binary version"
hash="c82c865545549131f284bf4df73c03c63971a87286fce5ab5d11c9dc0cee2cbb"
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  # Binary
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mv "./bin/gh" "${pkgdir}/usr/bin"
  # Man
  sudo mkdir -p "${pkgdir}/usr/share/man/man1"
  sudo mv "./share/man/man1" "${pkgdir}/usr/share/man"
}
