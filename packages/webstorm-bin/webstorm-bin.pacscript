pkgname="webstorm-bin"
pkgver="2025.3"
gives="webstorm"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Powerful and versatile IDE for JavaScript, TypeScript, HTML, CSS, React, Angular, Vue, and Node.js development."
source_amd64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}.tar.gz")
sha256sums_amd64=("c95584e810059c15d8e42f6e0aa09a9c19fa7386bdc2fe50dd6ff27d4274d7ef")
source_arm64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("5e0646f0a37e4dad896c35dc374f10fa24e9c9f665deacb52efc7a40462c0001")
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
