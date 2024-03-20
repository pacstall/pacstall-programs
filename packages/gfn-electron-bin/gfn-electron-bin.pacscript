name="gfn-electron-bin"
pkgname="geforcenow-electron"
pkgver="2.0.1"
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
repology=("project: geforcenow-electron")
url="https://github.com/hmlendea/gfn-electron/releases/download/v${pkgver}/geforcenow-electron_${pkgver}_linux.zip"
hash="43ce97be4029df53b5f8e7d3a8d93c2a6857a69aaf4213be4f4a6dfd0432d75e"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
depends=("libatk-bridge2.0-0" "libatspi2.0-0" "libgtk-3-0" "libnspr4" "libnss3" "libva2" "libva-glx2" "libva-drm2" "libva-wayland2" "libva-x11-2")

package() {
  # Get icon from github and install it
  wget -q "https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png"
  sudo install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/nvidia.png"

  # Install desktop file
  sudo install -Dm644 "${SRCDIR}/com.github.hmlendea.${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  sudo install -d "${pkgdir}/opt/${pkgname}/" "${pkgdir}/usr/bin"

  sudo cp -r "${SRCDIR}"/* "${pkgdir}"/opt/"${pkgname}"/
  sudo chmod +x "${pkgdir}/opt/${pkgname}/geforcenow-electron"
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo ln -s -r "/opt/${pkgname}/geforcenow-electron" "${pkgdir}/usr/bin/geforcenow"
}
