name="amfora-bin"
pkgname="amfora"
pkgver="1.9.2"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
pkgdesc="Amfora aims to be the best looking Gemini client with the most features"
hash=(
  "a468f97f0e3fa1d69868980fd0e5893388ccd9c849874d26e4d0b426fd6bff3e"
  "3d029d05cff8c42e82685ce7a61fcaa2118e4cbb6a547816a7d5150868a11092"
  "812e1faad6f6d4817eac60d36813472afebe2980cd2e661151a3d98669274207"
)
source=(
  "https://github.com/makeworld-the-better-one/amfora/releases/download/v${pkgver}/amfora_${pkgver}_linux_64-bit"
  "https://roboticoverlords.org/amfora.png"
  "https://raw.githubusercontent.com/makeworld-the-better-one/amfora/master/amfora.desktop"
)
maintainer="Elsie19 <elsie19@pm.me>"
repology=("project: ${pkgname}")

package() {
  sudo install -Dm644 amfora.png "${pkgdir}/usr/share/pixmaps/amfora.png"
  sudo install -Dm644 amfora.desktop "${pkgdir}/usr/share/applications/amfora.desktop"
  sudo install -Dm755 "amfora_${pkgver}_linux_64-bit" "${pkgdir}/usr/bin/${pkgname}"
}
