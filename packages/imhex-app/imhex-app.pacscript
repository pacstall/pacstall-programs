pkgname="imhex-app"
gives="imhex"
arch=("amd64")
pkgver="1.38.1"
license=("GPL-2.0")
url='https://imhex.werwolv.net/'
pkgdesc="Free and Open Source Hex Editor for all OSes and the Web"
maintainer=("raik199x <raik199x@mail.ru>")
source=(
  "https://github.com/WerWolv/ImHex/releases/download/v${pkgver}/${gives}-${pkgver}-x86_64.AppImage"
  "logo.svg::https://raw.githubusercontent.com/WerWolv/ImHex/refs/heads/master/plugins/builtin/romfs/assets/common/logo.svg"
)
sha256sums=(
  "20417481f9c05f0f4f633f9cd590e53ab6596fd755cc5b4c53374e5ae198e864"
  "7c1e7c6a2697ef68427d950cbb923951a3542943d2cbe88e4cb58fb7bcb8b0ad"
)

package() {
  install -Dm755 "${gives}-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/imhex"
  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "logo.svg" "${pkgdir}/usr/share/pixmaps/imhex-logo.svg"
  cat << EOF > "${pkgdir}/usr/share/applications/imhex.desktop"
[Desktop Entry]
Type=Application
Name=ImHex
Comment=Free and Open Source Hex Editor for all OSes and the Web
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/imhex %f
Icon=/usr/share/pixmaps/imhex-logo.svg
Terminal=false
Categories=Application;Editor;
EOF
}
