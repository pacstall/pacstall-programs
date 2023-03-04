name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks="${gives}-git ${gives}-deb"
replace="${gives}"
repology=("project: ${pkgname}")
version="2.22.1"
url="https://github.com/cli/cli/releases/download/v${version}/${gives}_${version}_linux_amd64.tar.gz"
description="GitHub's official command line tool - Binary version"
hash="76f7e18bdad5ddfdfcab40fce86c8d6f9fb27f9d29c1287cdf71e0d6b45ba84b"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

install() {
  # Binary
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mv "./bin/gh" "${pkgdir}/usr/bin"
  # Man
  sudo mkdir -p "${pkgdir}/usr/share/man/man1"
  sudo mv "./share/man/man1" "${pkgdir}/usr/share/man"
}

# vim:set ft=sh ts=2 sw=2 et:
