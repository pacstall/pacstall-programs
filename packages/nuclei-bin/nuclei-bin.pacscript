maintainer="0x262D <pacstall@copypaste.anonaddy.me>"

name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"

version="2.7.7"
description="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.zip"
hash="f95fd1cf44fd01175acfdfc13792d3745dabc465629cd5fc077fbd2b52e54b18"

breaks="${pkgname} ${pkgname}-deb ${pkgname}-git"
pkgdir="${STOWDIR}/${name}"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
