pkgname="feishin-app"
gives="feishin"
arch=("amd64" "arm64")
pkgver="0.18.0"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://github.com/jeffvli/feishin/'
source=("https://raw.githubusercontent.com/jeffvli/feishin/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-${pkgver}-linux-x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-${pkgver}-linux-arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("c03754efd5cfbfe10bbecad86480f1f21be92dfc31ce315f4f0c71713246763b")
sha256sums_arm64=("a848a78f01eed57f4e61470e0af1717d83bc93681fc3b25d6f0e8a52088677f2")
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
