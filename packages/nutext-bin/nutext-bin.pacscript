pkgname="nutext-bin"
gives="nutext"
repology=("project: ${gives}")
arch=("amd64" "arm64")
pkgver="0.5.0"
url='https://github.com/rhino-linux/nu_plugin_nutext'
source=("${url}/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.zip")
sha256sums_amd64=("564ca4eba6c2864446c997d1730dc086eff17f0e8ffbf0645486c10edfa6697c")
sha256sums_arm64=("4adc14516f17f4dedf60ddbc0c4bad5c8907df447ec17bd22cf22defca7a2c8a")
pkgdesc="Another translaton plugin for nushell"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=("nushell-bin")
replaces=("${gives}-git")

package() {
  cp -r "usr" "${pkgdir}"
}
