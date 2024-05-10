pkgname="goverlay-bin"
gives="goverlay"
pkgver="1.1.1"
source=(
  "https://github.com/benjamimgois/goverlay/releases/download/${pkgver}/goverlay_${pkgver//./_}.tar.xz"
  "https://raw.githubusercontent.com/benjamimgois/goverlay/master/data/icons/128x128/goverlay.png"
)
sha256sums=(
  "33dc0c6d8276308fd91102d622f44146237e800838cb500ec5dd222b10c83519"
  "SKIP"
)
depends=("mangohud" "libqt5pas-dev" "qt6ct" "adwaita-qt6")
replaces=("goverlay")
pkgdesc="Graphical UI to help manage Linux overlays"
maintainer=("xdavius <xdavius@github.com>")
repology=("project: goverlay")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/opt/goverlay/" "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
  echo -e "#!/bin/sh\nQT_QPA_PLATEFORMTHEME=qt6ct QT_STYLE_OVERRIDE=Adwaita-Dark mangohud /opt/goverlay/goverlay $@" | tee "${pkgdir}/usr/bin/goverlay" >/dev/null
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
Keywords=MangoHud;vkBasalt;ReplaySorcery;msi;afterburner;' | tee "${pkgdir}/usr/share/applications/goverlay.desktop" >/dev/null
  install -Dm644 "${srcdir}/goverlay.png" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}
