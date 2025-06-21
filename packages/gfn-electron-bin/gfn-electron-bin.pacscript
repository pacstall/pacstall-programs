pkgname="gfn-electron-bin"
gives="geforcenow-electron"
arch=("amd64")
pkgver="2.2.0"
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
repology=("project: geforcenow-electron")
source=(
  "@${pkgname}~${pkgver}::https://github.com/hmlendea/gfn-electron/releases/download/v${pkgver}/geforcenow-electron_${pkgver}_linux.zip"
  "icon.png::https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png"
)
sha256sums=(
  "ec62644e6f94eb4919c0895f73736b2074686c829144506162be38074ef1da2a"
  "SKIP"
)
maintainer=("Marie Piontek <marie@kaifa.ch>")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
depends=("libatk-bridge2.0-0" "libatspi2.0-0" "libgtk-3-0" "libnspr4" "libnss3" "libva2" "libva-glx2" "libva-drm2" "libva-wayland2" "libva-x11-2")

package() {
  cd "${pkgname}~${pkgver}"
  # Get icon from github and install it
  install -Dm644 "${srcdir}"/icon.png "${pkgdir}/usr/share/pixmaps/nvidia.png"

  # Install desktop file
  install -Dm644 "${srcdir}/com.github.hmlendea.${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  install -d "${pkgdir}/opt/${gives}/" "${pkgdir}/usr/bin"

  cp -r "${srcdir}"/* "${pkgdir}"/opt/"${gives}"/
  chmod +x "${pkgdir}/opt/${gives}/geforcenow-electron"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/geforcenow-electron" "${pkgdir}/usr/bin/geforcenow"
}
