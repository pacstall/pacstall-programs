pkgname="rustrover-bin"
pkgver="2026.1.3"
gives="rustrover"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="A powerhouse IDE for Rust developers"
source_amd64=("https://download.jetbrains.com/${gives}/RustRover-${pkgver}.tar.gz")
sha256sums_amd64=("d3ebf4e73c6f16a5d5d7773ca15f5d4d3c2d3beb21832c03ef973052264069bd")
source_arm64=("https://download.jetbrains.com/${gives}/RustRover-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("499e0e91680019e49a7c5a359a5e5dbf9b4de6cbbe1e0cdb1214391b33ea19da")
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
