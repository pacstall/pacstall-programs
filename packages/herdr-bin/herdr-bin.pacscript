pkgname=("herdr-bin")
gives="herdr"
pkgver="0.7.5"
repology=("project: herdr")
arch=("amd64" "arm64")
url='https://herdr.dev'
bugs="https://github.com/ogulcancelik/herdr/issues"
pkgdesc="Supervise multiple coding agents in one terminal"
conflicts=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
maintainer=("Jochen Hörmann <jochen.hoermann@gmail.com>")
provides=("${gives}")
license=("AGPL-3.0-or-later")
source_amd64=("${gives}::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
sha256sums_amd64=("3dc83288073e4c2d3c679a30e7be97bcca9141c6fd17dbbb9219142e95c59253")
source_arm64=("${gives}::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_arm64=("32e763a1499a6b694b1d708e4f062b743be1da9f34fcfa4d212d6db6fe09a8b9")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
