pkgname="rustrover-bin"
pkgver="2025.1.3"
gives="rustrover"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="A powerhouse IDE for Rust developers"
source_amd64=("https://download.jetbrains.com/${gives}/RustRover-${pkgver}.tar.gz")
sha256sums_amd64=("b3c4999f1d7ef7deffa56bfe75f011a012842bec5c199b0090d2ac45af78ea5e")
source_arm64=("https://download.jetbrains.com/${gives}/RustRover-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("4fcd2d8560dd7fe60c3262474dd1fcea1d54b476869a62ede0de86b8d115fce9")
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
