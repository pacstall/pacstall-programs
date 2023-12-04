name="gfn-electron-bin"
gives="geforcenow-electron"
pkgver="1.13.0"
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
repology=("project: geforcenow-electron")
url="https://github.com/hmlendea/gfn-electron/releases/download/v${pkgver}/geforcenow-electron_${pkgver}_linux.zip"
hash="cc0190621b8966c84b838be0518e264081757a90ad55a77a1289f8af8cf10088"
maintainer="Marie Piontek <marie@kaifa.ch>"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
depends=("libva2" "libva-glx2" "libva-drm2" "libva-wayland2" "libva-x11-2")

package() {
  # Get icon from github and install it
  wget -q "https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png"
  sudo install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/nvidia.png"

  # Install desktop file
  sudo install -Dm644 "${SRCDIR}/com.github.hmlendea.${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  sudo install -d "${pkgdir}/opt/${gives}/" "${pkgdir}/usr/bin"

  sudo cp -r "${SRCDIR}"/* "${pkgdir}"/opt/"${gives}"/
  sudo chmod +x "${pkgdir}/opt/${gives}/geforcenow-electron"
}

post_install() {
  sudo ln -s -r "/opt/${gives}/geforcenow-electron" "/usr/bin/geforcenow"
}

post_remove() {
  sudo rm -f "/usr/bin/geforcenow"
}
