pkgname="audiorelay-bin"
gives="audiorelay"
repology=("project: ${gives}")
arch=('amd64')
pkgver="0.27.5"
url='https://audiorelay.net'
source=("https://dl.audiorelay.net/setups/linux/audiorelay-${pkgver}.tar.gz")
sha256sums=("c4854139a4bd21e7bf7881a7b6e21ebc4cfe823286783d4fb9ad4bf4edf8e8c7")
conflicts=("${gives}-deb")
pkgdesc="Turn your phone into a microphone or speakers for PC"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")

prepare() {
  mkdir -p "${pkgdir}/opt/${gives}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  cd "${gives}-${pkgver}"

  cp -r ./* "${pkgdir}/opt/${gives}"
  ln -sf "/opt/${gives}/bin/AudioRelay" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${pkgdir}/opt/${gives}/lib/AudioRelay.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${gives}.png"

  cat << EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  [Desktop Entry]
Name=AudioRelay
Comment=Turn your phone into a microphone or speakers for PC
Exec=audiorelay
Icon=audiorelay
Terminal=false
Type=Application
Categories=Audio;Utility
EOF
}
