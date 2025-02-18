pkgname="intellij-idea-community-bin"
pkgver="2024.3.3"
gives="intellij-idea-community"
arch=("amd64" "arm64")
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="IDE for developing computer software written in Java, Kotlin, Groovy, and other JVM-based languages"
source_amd64=("https://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz")
sha256sums_amd64=("ad9d587b704806d9a21dfebe5c51415df94699bba958d7133763cfd56934ced8")
source_arm64=("https://download.jetbrains.com/idea/ideaIC-${pkgver}-aarch64.tar.gz")
sha256sums_arm64=("0135027b97fcabd8f9e31d34cd2444323c63c894ef3f8c6eaf734fbecb8694ef")
repology=("project: ${gives}")

package() {
  cd "${srcdir}/idea-IC-243.23654.117"
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
