pkgname="intellij-idea-community-bin"
pkgver="2024.3.3"
gives="intellij-idea-community"
arch=("amd64" "arm64")
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="IDE for developing computer software written in Java, Kotlin, Groovy, and other JVM-based languages"
source_amd64=("https://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz")
sha256sums_amd64=("ae3c45fe515fef672f52ce5c4701bc40a5f82cb94f21fed2c6e66c22e3dc91db")
source_arm64=("https://download.jetbrains.com/idea/ideaIC-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("9ce7e15135e97e92601654f456a6211127c165b35f62784886c4ec3b466af8f9")
repology=("project: ${gives}")

package() {
  cd "${srcdir}/idea-IC-243.24978.46"
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
