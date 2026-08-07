pkgname="intellij-idea-community-bin"
pkgver="2026.1.3"
gives="intellij-idea-community"
arch=("amd64" "arm64")
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="IDE for developing computer software written in Java, Kotlin, Groovy, and other JVM-based languages"
source_amd64=("https://github.com/JetBrains/intellij-community/releases/download/idea%2F${pkgver}/idea-${pkgver}.tar.gz")
source_arm64=("https://github.com/JetBrains/intellij-community/releases/download/idea%2F${pkgver}/idea-${pkgver}-aarch64.tar.gz")
sha256sums_amd64=("54d7938d7d892fc738890986b74115cf4ed11d7e74bac6888e912ecd783db837")
sha256sums_arm64=("2c77a40856cce5deacbbbe27555ace1c5cb25f92b23f6e8f48b41cba9f6db4e5")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"/idea-IC-*
  install -dm755 "${pkgdir}/usr/share/licenses/intellij-idea-community"
  install -dm755 "${pkgdir}/usr/share/intellij-idea-community"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib modules plugins product-info.json "${pkgdir}/usr/share/intellij-idea-community/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/intellij-idea-community/"
  cp -dr "bin/idea.png" "${pkgdir}/usr/share/pixmaps/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/usr/share/intellij-idea-community/bin/idea.sh" "${pkgdir}/usr/bin/idea"
  install -dm755 "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/intellij-idea-community.desktop"
[Desktop Entry]
Type=Application
Name=IntelliJ IDEA Community Edition
Icon=idea
Exec=/usr/share/intellij-idea-community/bin/idea
Comment=IDE for developing computer software written in Java, Kotlin, Groovy, and other JVM-based languages.
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea
EOF
}
