pkgname="rustrover-bin"
pkgver="2024.3.4"
gives="rustrover"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="A powerhouse IDE for Rust developers"
source_amd64=("https://download.jetbrains.com/${gives}/RustRover-${pkgver}.tar.gz")
sha256sums_amd64=("1e7347b37a26715f5afdf101208342e6088d0d8421c9ee1661f48efb38cac8b4")
source_arm64=("https://download.jetbrains.com/${gives}/RustRover-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("a1b3626907930d32f256d14598e1013ce6999fae28a61f71013be2a7e7c52a1d")
repology=("project: rustrover")

package() {
  cd "${srcdir}/RustRover-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/licenses/rustrover/"
  mkdir -p "${pkgdir}/usr/share/rustrover/"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib modules plugins product-info.json "${pkgdir}/usr/share/rustrover/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/rustrover/"
  cp -dr "${pkgdir}/usr/share/rustrover/bin/rustrover.png" "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/share/rustrover/bin/rustrover.sh" "${pkgdir}/usr/bin/rustrover"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/rustrover.desktop"
[Desktop Entry]
Type=Application
Name=RustRover
Icon=rustrover
Exec=/usr/share/rustrover/bin/rustrover
Comment=A powerhouse IDE for Rust developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-rustrover
EOF
}
