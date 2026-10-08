pkgname="feishin-app"
gives="feishin"
arch=("amd64" "arm64")
pkgver="1.13.0"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://github.com/jeffvli/feishin/'
source=("https://raw.githubusercontent.com/jeffvli/feishin/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("2c8b6d89f310a03953c8def2e37f72f52bb93000f60f08b6ebe38f38e795f4eb")
sha256sums_arm64=("3cacc03ed06ba08c06936f2ef3d5753ae9e27a34777a5b5a221f83735a048e70")
pkgdesc="A modern self-hosted music player"
repology=("project: ${gives}")
maintainer=("faelau <git@faessler.sh>")

prepare() {
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  install -Dm755 "${gives}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  cat << EOF > "${pkgdir}/usr/share/applications/${gives}.desktop"
[Desktop Entry]
Type=Application
Name=Feishin
Icon=feishin
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/feishin --no-sandbox
Comment=A modern self-hosted music player.
Categories=AudioVideo;Audio;Player;
Terminal=false
EOF
}
