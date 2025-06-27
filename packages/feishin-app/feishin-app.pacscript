pkgname="feishin-app"
gives="feishin"
arch=("amd64" "arm64")
pkgver="0.16.0"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://github.com/jeffvli/feishin/'
source=("https://raw.githubusercontent.com/jeffvli/feishin/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-${pkgver}-linux-x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-${pkgver}-linux-arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("219e531997fe8f07fcba7db3db3b09a97ab68f184f60bfeed268afd068a8ef96")
sha256sums_arm64=("bb850a77673eb2ffdba95d4d1732bf170d42bd78e5ad83754bf4ee9be0892173")
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
