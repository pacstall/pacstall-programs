pkgname="intellij-idea-community-bin"
pkgver="2024.1"
gives="intellij-idea-community"
repology=("project: intellij-idea-community")
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>")
pkgdesc="IntelliJ IDEA is an IDE for developing computer software written in Java, Kotlin, Groovy, and other JVM-based languages"
arch=('amd64' 'arm64')
sha256sums_amd64=(
  "01d1b224c5e88592f954b17796a76fa8391cdcafef27264e703c7ffe47bb4065"
  "20c489d224f83cf4b29174b8c398e256b1df0e9cb0b920890f39c5796404b293"
)
sha256sums_arm64=(
  "a13e7a53b5c8a512fbcb72957f24e5515618a5533f17d72914da5445b736dac1"
  "20c489d224f83cf4b29174b8c398e256b1df0e9cb0b920890f39c5796404b293"
)
if [[ ${CARCH} == amd64 ]]; then
  archext="${pkgver}"
else
  archext="${pkgver}-aarch64"
fi
source=(
  "https://download-cdn.jetbrains.com/idea/ideaIC-${archext}.tar.gz"
  "intellij-idea-community.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/intellij-idea-community.desktop"
)
repology=("project: intellij-idea-community")

package() {
  cd "${_archive}"
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

# vim:set ft=sh ts=2 sw=2 et:
