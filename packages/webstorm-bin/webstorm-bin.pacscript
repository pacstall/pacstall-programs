pkgname="webstorm-bin"
pkgver="2024.3.1.1"
gives="webstorm"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Powerful and versatile IDE for JavaScript, TypeScript, HTML, CSS, React, Angular, Vue, and Node.js development."
source_amd64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}.tar.gz")
sha256sums_amd64=("275999ca069658257d6f06875f283abf9c0b102bdf812cf7eefe86a1dda90c1b")
source_arm64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("b136ec6696a47511a7396eb5416ff055964a040d72ed29eb6c362e1b37ce0ab5")
repology=("project: webstorm")

package() {
  cd "${srcdir}/WebStorm-243.22562.222"
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
