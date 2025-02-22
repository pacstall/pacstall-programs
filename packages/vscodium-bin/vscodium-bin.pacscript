pkgname="vscodium-bin"
gives="codium"
pkgver="1.97.2.25045"
arch=("amd64")
pkgdesc="VSCodium is a community-driven, freely-licensed binary distribution of Microsoft’s editor VS Code."
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=(
  "https://github.com/VSCodium/vscodium/releases/download/${pkgver}/VSCodium-linux-x64-${pkgver}.tar.gz"
  "https://vscodium.com/img/codium_cnl.svg"
)
sha256sums=(
  "aa0248375a070c49cfc9e1c971ff758fb1370177f61ce6570504235e6270a793"
  "SKIP"
)
repology=("project: ${gives}")

package() {
  cd "${srcdir}/."
  mkdir -p "${pkgdir}/usr/share/codium"
  cp -r ./* "${pkgdir}/usr/share/codium"
  chmod +x "${pkgdir}/usr/share/codium/codium"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/codium_cnl.svg" "${pkgdir}/usr/share/pixmaps/codium.svg"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/codium.desktop"
[Desktop Entry]
Name=VSCodium
Comment=Free/Libre Open Source Software Binaries of VS Code
Exec=/usr/share/codium/codium
Terminal=false
Type=Application
Icon=codium
Categories=Development;IDE;
StartupNotify=true
EOF
}
