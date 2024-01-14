name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replace=("${gives}")
repology=("project: ${pkgname}")
pkgver="2.40.1"
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz"
pkgdesc="GitHub's official command line tool - Binary version"
hash="7f34ee83a7dd17addd1d029bc66ec06d91773a93172e3e1e30e0ec3a9f923fe2"
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
