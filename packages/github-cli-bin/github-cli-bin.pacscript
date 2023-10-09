name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replace=("${gives}")
repology=("project: ${pkgname}")
pkgver="2.36.0"
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz"
pkgdesc="GitHub's official command line tool - Binary version"
hash="29ed6c04931e6ac8a5f5f383411d7828902fed22f08b0daf9c8ddb97a89d97ce"
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

# vim:set ft=sh ts=2 sw=2 et:
