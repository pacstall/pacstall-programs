pkgname="webstorm-bin"
pkgver="2024.3.2"
gives="webstorm"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Powerful and versatile IDE for JavaScript, TypeScript, HTML, CSS, React, Angular, Vue, and Node.js development."
source_amd64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}.tar.gz")
sha256sums_amd64=("2e9054ae506e578cf89e4cea017d953c416281470a4a5728b157e43ac4888d4e")
source_arm64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("9914fe6e6b5f0a7e87c9628fdf70b5083b68ec14b8873ad6847e4ea8e8c80a96")
repology=("project: webstorm")

package() {
  cd "${srcdir}/WebStorm-243.23654.120"
  mkdir -p "${pkgdir}/usr/share/licenses/webstorm"
  mkdir -p "${pkgdir}/usr/share/webstorm"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin help jbr lib modules plugins product-info.json "${pkgdir}/usr/share/webstorm/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/webstorm/"
  cp -dr "${pkgdir}/usr/share/webstorm/bin/webstorm.png" "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/share/webstorm/bin/webstorm.sh" "${pkgdir}/usr/bin/webstorm"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/webstorm.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=WebStorm
Icon=webstorm
Exec=/usr/share/webstorm/bin/webstorm
Comment=Powerful and versatile IDE for JavaScript, TypeScript, HTML, CSS, React, Angular, Vue, and Node.js development.
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-webstorm
EOF
}
