pkgname="aqua-ide-bin"
pkgver="2024.3.1"
gives="aqua"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="The IDE for test automation"
source_amd64=("https://download-cdn.jetbrains.com/${gives}/${gives}-${pkgver}.tar.gz")
sha256sums_amd64=("e304d8f900881d18865010819dc035d59be00b1364baa2b98ef47d923907ce57")
source_arm64=("https://download-cdn.jetbrains.com/${gives}/${gives}-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("4895ad44a456f56121cc4e78be45b6a4ccae8080ab7251cd434304465d01f7c4")
repology=("project: aqua")

package() {
  cd "${srcdir}/${gives}-243.22562.238"
  mkdir -p "${pkgdir}/usr/share/licenses/aqua"
  mkdir -p "${pkgdir}/usr/share/aqua"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib modules plugins product-info.json "${pkgdir}/usr/share/aqua/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/aqua/"
  cp -dr "${pkgdir}/usr/share/aqua/bin/aqua.png" "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/share/aqua/bin/aqua.sh" "${pkgdir}/usr/bin/aqua"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/aqua.desktop"
[Desktop Entry]
Type=Application
Name=Aqua
Icon=aqua
Exec=/usr/share/aqua/bin/aqua
Comment=The IDE for test automation.
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-aqua
EOF
}
