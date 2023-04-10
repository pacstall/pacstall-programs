maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
version="2.9.1"
description="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.zip"
hash="4921388205d38fcea08dd3bf48fc351f0c47a1bc1085f060c5dd3f1f2dc1a78c"
arch=('amd64')
breaks="${pkgname} ${pkgname}-deb ${pkgname}-git"
repology=("project: ${pkgname}")

install() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
