pkgname="feishin-app"
gives="feishin"
arch=("amd64" "arm64")
pkgver="1.6.0"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://github.com/jeffvli/feishin/'
source=("https://raw.githubusercontent.com/jeffvli/feishin/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("2c0320f52fa5d022c2cfe01de7b75df2cbef97156e71ac8f2daddb3f8289c35d")
sha256sums_arm64=("0d8ea318a4c90e5c467cdb69e9ab9689647e2998d3513d9324042b2bf4dd2ea0")
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
