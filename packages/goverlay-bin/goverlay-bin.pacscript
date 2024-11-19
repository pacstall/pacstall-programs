pkgname="goverlay-bin"
gives="goverlay"
arch=("amd64")
pkgver="1.2.0"
_pkgver="1.2"
source=(
  "https://github.com/benjamimgois/goverlay/releases/download/${_pkgver}/goverlay.tar.xz"
  "https://raw.githubusercontent.com/benjamimgois/goverlay/master/data/icons/128x128/goverlay.png"
)
sha256sums=(
  "6b2f33564ec14b70c4dc6905084d8d3657013e8050e27345e1aad7b485fb97b0"
  "SKIP"
)
depends=("mangohud" "qt6ct" "adwaita-qt6")
pacdeps=("qt6pas")
replaces=("goverlay")
pkgdesc="Graphical UI to help manage Linux overlays"
maintainer=("xdavius <xdavius@github.com>")
repology=("project: goverlay")

package() {
  mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/opt/goverlay/" "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
  echo -e "#!/bin/sh\nQT_QPA_PLATEFORMTHEME=qt6ct QT_STYLE_OVERRIDE=Adwaita-Dark mangohud /opt/goverlay/goverlay \$@" | tee "${pkgdir}/usr/bin/goverlay" > /dev/null
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
