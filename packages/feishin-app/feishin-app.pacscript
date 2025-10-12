pkgname="feishin-app"
gives="feishin"
arch=("amd64" "arm64")
pkgver="0.19.0"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://github.com/jeffvli/feishin/'
source=("https://raw.githubusercontent.com/jeffvli/feishin/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("a133b3cd9c6feb75b5199ca7c2ab108f47dbfed3977db0f828b0afcfd6aad76c")
sha256sums_arm64=("9bc13c515793575c7af50b06cac3d73dd0ca091c75670e5a858711823bbb22ce")
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
