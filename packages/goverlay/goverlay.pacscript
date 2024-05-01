pkgname="goverlay"
gives="goverlay"
pkgver="1.0"
source=(
  "https://github.com/benjamimgois/goverlay/releases/download/${pkgver}/goverlay_${pkgver//.*}.tar.xz"
  "https://raw.githubusercontent.com/benjamimgois/goverlay/master/data/icons/128x128/goverlay.png"
)
sha256sums=(
  "47754023d12b9eb730c83fe9aeec7b8523d1dbaa9860c90928ddaa904b89aa1f"
  "SKIP"
)
depends=("mangohud" "libqt5pas-dev")
pkgdesc="Graphical UI to help manage Linux overlays"
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: goverlay")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/opt/goverlay/" "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
  echo -e "#!/bin/sh\nQT_QPA_PLATFORM=xcb mangohud --dlsym /opt/goverlay/goverlay" | tee "${pkgdir}/usr/bin/goverlay" > /dev/null
  chmod +x "${pkgdir}/usr/bin/goverlay"
  install -Dm755 goverlay "${pkgdir}/opt/goverlay/goverlay"
  echo '[Desktop Entry]
Name=GOverlay
Comment=Graphical UI to help manage Vulkan / OpenGL overlays
Exec=goverlay
Icon=goverlay
Terminal=false
Type=Application
Categories=Game;
Keywords=MangoHud;vkBasalt;ReplaySorcery;msi;afterburner;' | tee "${pkgdir}/usr/share/applications/goverlay.desktop" > /dev/null
  install -Dm644 "${srcdir}/goverlay.png" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}
