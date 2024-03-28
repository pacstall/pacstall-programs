pkgname="amfora-bin"
gives="amfora"
pkgver="1.9.2"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
pkgdesc="Amfora aims to be the best looking Gemini client with the most features"
sha256sums=(
  "a468f97f0e3fa1d69868980fd0e5893388ccd9c849874d26e4d0b426fd6bff3e"
  "SKIP"
  "SKIP"
)
source=(
  "https://github.com/makeworld-the-better-one/amfora/releases/download/v${pkgver}/amfora_${pkgver}_linux_64-bit"
  "amfora.png::https://roboticoverlords.org/amfora.png"
  "amfora.desktop::https://raw.githubusercontent.com/makeworld-the-betterne/amfora/master/amfora.desktop"
)
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: ${gives}")

prepare() {
  cd "${_archive}"
  if [[ "$(sha256sum ${srcdir}/amfora.png | cut -d' ' -f 1)" != "3d029d05cff8c42e82685ce7a61fcaa2118e4cbb6a547816a7d5150868a11092" ]]; then
    fancy_message error "Checksum for ${srcdir}/amfora.png failed"
    return 1
  fi
  if [[ "$(sha256sum ${srcdir}/amfora.desktop | cut -d' ' -f 1)" != "812e1faad6f6d4817eac60d36813472afebe2980cd2e661151a3d98669274207" ]]; then
    fancy_message error "Checksum for ${srcdir}/amfora.desktop failed"
    return 1
  fi
}

package() {
  cd "${_archive}"
  sudo install -Dm644 ${srcdir}/amfora.png "${pkgdir}/usr/share/pixmaps/amfora.png"
  sudo install -Dm644 ${srcdir}/amfora.desktop "${pkgdir}/usr/share/applications/amfora.desktop"
  sudo install -Dm755 "amfora_${pkgver}_linux_64-bit" "${pkgdir}/usr/bin/${gives}"
}
