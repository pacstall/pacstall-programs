maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
version="2.9.2"
description="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.zip"
hash="a17df25116612d3fc7292f2e3e540ab23b72dafbf5fab0ac6174b7cc924c9565"
arch=('amd64')
breaks="${pkgname} ${pkgname}-deb ${pkgname}-git"
repology=("project: ${pkgname}")

install() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
