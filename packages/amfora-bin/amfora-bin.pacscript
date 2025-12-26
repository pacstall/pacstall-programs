pkgname="amfora-bin"
gives="amfora"
arch=("amd64")
pkgver="1.11.0"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
pkgdesc="Amfora aims to be the best looking Gemini client with the most features"
sha256sums=(
  "a8ac319fd43af5ea7ce967caa4d3d00d20fca7aa8de0fda30a3e0ddde985b3a3"
  "3d029d05cff8c42e82685ce7a61fcaa2118e4cbb6a547816a7d5150868a11092"
  "812e1faad6f6d4817eac60d36813472afebe2980cd2e661151a3d98669274207"
)
source=(
  "https://github.com/makew0rld/amfora/releases/download/v${pkgver}/amfora_${pkgver}_linux_64-bit"
  "amfora.png::https://roboticoverlords.org/amfora.png"
  "amfora.desktop::https://raw.githubusercontent.com/makew0rld/amfora/master/amfora.desktop"
)
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  install -Dm644 "${srcdir}"/amfora.png "${pkgdir}/usr/share/pixmaps/amfora.png"
  install -Dm644 "${srcdir}"/amfora.desktop "${pkgdir}/usr/share/applications/amfora.desktop"
  install -Dm755 "amfora_${pkgver}_linux_64-bit" "${pkgdir}/usr/bin/${gives}"
}
