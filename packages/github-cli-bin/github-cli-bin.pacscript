name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replace=("${gives}")
repology=("project: ${pkgname}")
version="2.31.0"
url="https://github.com/cli/cli/releases/download/v${version}/${gives}_${version}_linux_amd64.tar.gz"
description="GitHub's official command line tool - Binary version"
hash="eec349e43803759d3d7a138d214ae983a3bebebd8e6dd0ec0ff1eea7bdd823e7"
arch=('amd64')

install() {
  # Binary
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mv "./bin/gh" "${pkgdir}/usr/bin"
  # Man
  sudo mkdir -p "${pkgdir}/usr/share/man/man1"
  sudo mv "./share/man/man1" "${pkgdir}/usr/share/man"
}

# vim:set ft=sh ts=2 sw=2 et:
