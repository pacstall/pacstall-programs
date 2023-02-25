maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
version="2.8.3"
description="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.zip"
hash="6d544d7ceee2c0f80258bb6c18276004e3e1bc76d072bf64a49022b27b8fa0c6"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-git"
repology=("project: ${pkgname}")

install() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
