name="amfora-bin"
pkgname="amfora"
pkgver="1.10.0"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
pkgdesc="Amfora aims to be the best looking Gemini client with the most features"
hash="b2e9e50954345b38c4481e200944950675d30cdd4e1d7eef50d5b3a528cc1a0a"
url="https://github.com/makeworld-the-better-one/amfora/releases/download/v${pkgver}/amfora_${pkgver}_linux_64-bit"
maintainer="Elsie19 <elsie19@pm.me>"
repology=("project: ${pkgname}")

prepare() {
  wget -q https://roboticoverlords.org/amfora.png
  if [[ "$(sha256sum amfora.png | cut -d' ' -f 1)" != "3d029d05cff8c42e82685ce7a61fcaa2118e4cbb6a547816a7d5150868a11092" ]]; then
    fancy_message error "Checksum for amfora.png failed"
    return 1
  fi
  wget -q https://raw.githubusercontent.com/makeworld-the-better-one/amfora/master/amfora.desktop
  if [[ "$(sha256sum amfora.desktop | cut -d' ' -f 1)" != "812e1faad6f6d4817eac60d36813472afebe2980cd2e661151a3d98669274207" ]]; then
    fancy_message error "Checksum for amfora.desktop failed"
    return 1
  fi
}

package() {
  sudo install -Dm644 amfora.png "${pkgdir}/usr/share/pixmaps/amfora.png"
  sudo install -Dm644 amfora.desktop "${pkgdir}/usr/share/applications/amfora.desktop"
  sudo install -Dm755 "amfora_${pkgver}_linux_64-bit" "${pkgdir}/usr/bin/${pkgname}"
}
