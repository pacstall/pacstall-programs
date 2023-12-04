name="github-cli-bin"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replace=("${gives}")
repology=("project: github-cli")
pkgver="2.38.0"
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz"
pkgdesc="GitHub's official command line tool - Binary version"
hash="c56b80a03c3b4216cd1ab63f6c7bfa4c356c67bce265fc067953bec10cdf0f97"
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
