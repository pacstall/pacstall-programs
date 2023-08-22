name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replace=("${gives}")
repology=("project: ${pkgname}")
pkgver="2.33.0"
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.tar.gz"
pkgdesc="GitHub's official command line tool - Binary version"
hash="c46d0adae4dbd0589a62b6a1d822b84ca5184ee78d246d21d5c082ab9f38a04e"
arch=('amd64')

package() {
  # Binary
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mv "./bin/gh" "${pkgdir}/usr/bin"
  # Man
  sudo mkdir -p "${pkgdir}/usr/share/man/man1"
  sudo mv "./share/man/man1" "${pkgdir}/usr/share/man"
}

# vim:set ft=sh ts=2 sw=2 et:
