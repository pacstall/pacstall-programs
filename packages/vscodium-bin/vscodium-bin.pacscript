pkgname="vscodium-bin"
gives="codium"
pkgver="1.96.4.25017"
arch=("amd64")
pkgdesc="VSCodium is a community-driven, freely-licensed binary distribution of Microsoft’s editor VS Code."
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=(
	"https://github.com/VSCodium/vscodium/releases/download/${pkgver}/VSCodium-linux-x64-${pkgver}.tar.gz"
	"https://vscodium.com/img/codium_cnl.svg"
)
sha256sums=(
	"c5b78556cb0674fa7de0e349c13adbc2028e6080fd04d7c3ff1a8ed541421cd1"
	"56b4790e59b73cee84055135be2bceccc83d51f6db5c1cfd42d510f2a1088691"
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
