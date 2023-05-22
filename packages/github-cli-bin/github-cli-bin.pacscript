name="github-cli-bin"
pkgname="github-cli"
gives="gh"
breaks=("${gives}-git" "${gives}-deb")
replace=("${gives}")
repology=("project: ${pkgname}")
version="2.29.0"
url="https://github.com/cli/cli/releases/download/v${version}/${gives}_${version}_linux_amd64.tar.gz"
description="GitHub's official command line tool - Binary version"
hash="9fe05f43a11a7bf8eacf731422452d1997e6708d4160ef0efcb13c103320390e"
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
