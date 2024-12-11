pkgname="webstorm-bin"
pkgver="2024.3.1"
gives="webstorm"
arch=("amd64" "arm64")
maintainer=("James Ed Randson <jimedrand@disroot.org>")
pkgdesc="Powerful and versatile IDE for JavaScript, TypeScript, HTML, CSS, React, Angular, Vue, and Node.js development."
external_connection="true"
source_amd64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}.tar.gz")
sha256sums_amd64=("f9122a02312bee9d06c77774cad37b32ac0dcbc460af4ac8b8059a1780d16018")
source_arm64=("https://download.jetbrains.com/${gives}/WebStorm-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("e1b34cf2456233f6a7aa079e7c2af23bc88d4b29bbddcf6d7a5b4e0432e38db3")
repology=("project: webstorm")

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/share/licenses/webstorm"
  mkdir -p "${pkgdir}/usr/share/webstorm"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}/usr/share/webstorm/"
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
Exec=/usr/share/webstorm/bin/webstorm.sh
Comment=Powerful and versatile IDE for JavaScript, TypeScript, HTML, CSS, React, Angular, Vue, and Node.js development.
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-webstorm
EOF
}
