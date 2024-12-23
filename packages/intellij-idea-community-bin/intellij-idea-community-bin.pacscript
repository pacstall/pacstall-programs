pkgname="intellij-idea-community-bin"
pkgver="2024.3.1"
gives="intellij-idea-community"
repology=("project: intellij-idea-community")
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>" "James Ed Randson <jimedrand@disroot.org>")
pkgdesc="IntelliJ IDEA is an IDE for developing computer software written in Java, Kotlin, Groovy, and other JVM-based languages"
arch=('amd64' 'arm64')
external_connection="true"
sha256sums_amd64=(
  "b3fbdba793ba9e7800ac1ee4ceedf4726f86d5320c7c0d4e155b5bd10a296777"
  "20c489d224f83cf4b29174b8c398e256b1df0e9cb0b920890f39c5796404b293"
)
sha256sums_arm64=(
  "dc3427884cc1b98cd79d152b9d808a72b99f751dc627063148dce862853819d4"
  "20c489d224f83cf4b29174b8c398e256b1df0e9cb0b920890f39c5796404b293"
)
source_amd64=(
  "@${pkgname}~${pkgver}::https://download-cdn.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz"
  "intellij-idea-community.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/intellij-idea-community.desktop"
)
source_arm64=(
  "@${pkgname}~${pkgver}::https://download-cdn.jetbrains.com/idea/ideaIC-${pkgver}-aarch64.tar.gz"
  "intellij-idea-community.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/intellij-idea-community.desktop"
)
repology=("project: intellij-idea-community")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/share/licenses/intellij-idea-community"
  mkdir -p "${pkgdir}/usr/share/intellij-idea-community"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}/usr/share/intellij-idea-community/"
  cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/intellij-idea-community/"
  cp -dr "${pkgdir}/usr/share/intellij-idea-community/bin/idea.png" "${pkgdir}/usr/share/pixmaps/"
  install -Dm 644 "${srcdir}"/intellij-idea-community.desktop -t "${pkgdir}"/usr/share/applications/
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/share/intellij-idea-community/bin/idea.sh" "${pkgdir}/usr/bin/idea"
}
