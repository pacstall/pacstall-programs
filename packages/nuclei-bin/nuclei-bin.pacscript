maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
version="2.9.4"
description="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.zip"
hash="2d0d5251b383ec37c52153e5944a290294e0a007e8dbbf7456605701119c7cda"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

install() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
