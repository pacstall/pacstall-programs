name="topgrade-musl-bin"
pkgname="topgrade"
version="12.0.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-musl.tar.gz"
description="Upgrades everything on your system"
hash="54bd17b1b72d0e4f39159ea8f4db9d42f081c1c97dcfc91f679d2e2bd13963bd"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
