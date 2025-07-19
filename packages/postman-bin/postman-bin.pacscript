pkgname="postman-bin"
gives="postman"
pkgver="11.54.6"
pkgdesc="Build, test, and document your APIs faster"
arch=("amd64")
breaks=("postman" "postman-deb" "postman-app")
depends=("libxss1" "libnss3" "libgtk-3-0")
makedepends=("tar")
repology=("project: postman" "visiblename: postman-bin")
source=(
  "https://dl.pstmn.io/download/version/${pkgver}/linux64"
  "postman.desktop::https://aur.archlinux.org/cgit/aur.git/plain/postman.desktop?h=postman-bin"
)
sha256sums=(
  "a1bf3d7171e5253050922f202fc26346a4ab3e0f925a967bf1bb8a47c7273a4f"
  "SKIP"
)
maintainer=("Marie Piontek <marie@kaifa.ch>")

package() {
  cd "${srcdir}"
  # Get desktop file and install it
  install -Dm644 "${srcdir}"/postman.desktop -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  install -d "${pkgdir}/opt/postman/" "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

  tar -xzf linux64
  cp -r "${srcdir}/Postman/app/"* "${pkgdir}/opt/postman/"
  chmod +x "${pkgdir}/opt/postman/postman"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  ln -sf "/opt/postman/resources/app/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"
}
