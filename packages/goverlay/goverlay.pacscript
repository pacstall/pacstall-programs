name="goverlay"
gives="goverlay"
pkgver="1.0"
source=(
  "https://github.com/benjamimgois/goverlay/releases/download/${pkgver}/goverlay_${pkgver//.*}.tar.xz"
  "https://raw.githubusercontent.com/benjamimgois/goverlay/master/data/icons/128x128/goverlay.png"
)
hash=(
  "47754023d12b9eb730c83fe9aeec7b8523d1dbaa9860c90928ddaa904b89aa1f"
  "SKIP"
)
depends=("mangohud" "libqt5pas-dev")
pkgdesc="Graphical UI to help manage Linux overlays"
maintainer="Elsie19 <elsie19@pm.me>"
repology=("project: goverlay")

package() {
  sudo mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/opt/goverlay/" "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
  echo -e "#!/bin/sh\nQT_QPA_PLATFORM=xcb mangohud --dlsym /opt/goverlay/goverlay" | sudo tee "${pkgdir}/usr/bin/goverlay" > /dev/null
  sudo chmod +x "${pkgdir}/usr/bin/goverlay"
  sudo install -Dm755 goverlay "${pkgdir}/opt/goverlay/goverlay"
  echo '[Desktop Entry]
Name=GOverlay
Comment=Graphical UI to help manage Vulkan / OpenGL overlays
Exec=goverlay
Icon=goverlay
Terminal=false
Type=Application
Categories=Game;
Keywords=MangoHud;vkBasalt;ReplaySorcery;msi;afterburner;' | sudo tee "${pkgdir}/usr/share/applications/goverlay.desktop" > /dev/null
  sudo install -Dm644 goverlay.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}
