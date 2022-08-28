name="upscayl-app"
pkgname="upscayl"
gives="upscayl"
version="1.1.1"
description="Upscayl - Free and Open Source AI Image Upscaler for Linux, MacOS and Windows"
maintainer="0x262D <pacstall@copypaste.anonaddy.me>"

url="https://github.com/TGS963/${gives}/releases/download/v${version}/Upscayl-${version}.AppImage"
hash="d69f54f6b9d211cedb93d1f05fff4a2f25fe215b72d0988239d56ccb03b9b046"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-bin ${pkgname}-git"
pkgdir="${STOWDIR}/${name}"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install appimage
  sudo install -Dm755 "Upscayl-${version}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  wget -O "${pkgname}.png" -q "https://raw.githubusercontent.com/TGS963/${gives}/main/main/build/icon.png"
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
