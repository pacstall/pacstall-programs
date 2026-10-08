pkgname="herdr-bin"
gives="herdr"
pkgver="0.9.0"
repology=("project: herdr")
arch=("amd64" "arm64")
url='https://herdr.dev'
bugs='https://github.com/ogulcancelik/herdr/issues'
pkgdesc="Supervise multiple coding agents in one terminal"
conflicts=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
maintainer=("Jochen Hörmann <jochen.hoermann@gmail.com>")
provides=("${gives}")
license=("AGPL-3.0-or-later")
source_amd64=("${gives}::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
sha256sums_amd64=("4fa1a01158dd8043da92d31b270780b0dcc10603038d9b61cac4d81ab63fb71f")
source_arm64=("${gives}::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_arm64=("9c8db20fb7e7427b138d5367113f1621ffd319f2f65d6f009e2594029115f0d2")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
