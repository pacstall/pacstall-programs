name="intellij-idea-community-bin"
pkgver="2024.1"
pkgname="intellij-idea-community"
gives="intellij-idea-community"
repology=("project: intellij-idea-community")
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"
pkgdesc="IntelliJ IDEA is an IDE for developing computer software written in Java, Kotlin, Groovy, and other JVM-based languages"
arch=('amd64' 'arm64')
if [[ ${CARCH} == amd64 ]]; then
  archext="${pkgver}"
  hash="01d1b224c5e88592f954b17796a76fa8391cdcafef27264e703c7ffe47bb4065"
else
  archext="${pkgver}-aarch64"
  hash="a13e7a53b5c8a512fbcb72957f24e5515618a5533f17d72914da5445b736dac1"
fi
url="https://download-cdn.jetbrains.com/idea/ideaIC-${archext}.tar.gz"
repology=("project: intellij-idea-community")
desktop_file_sum="20c489d224f83cf4b29174b8c398e256b1df0e9cb0b920890f39c5796404b293"

prepare() {
  wget -qO "intellij-idea-community.desktop" "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/intellij-idea-community.desktop"
  if [[ "$(sha256sum intellij-idea-community.desktop | cut -d' ' -f 1)" != "${desktop_file_sum}" ]]; then
    fancy_message error "Checksum for intellij-idea-community.desktop failed"
    return 1
  fi
}

package() {
  sudo mkdir -p "${pkgdir}/usr/share/licenses/intellij-idea-community"
  sudo mkdir -p "${pkgdir}/usr/share/intellij-idea-community"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps"
  sudo cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}/usr/share/intellij-idea-community/"
  sudo cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/intellij-idea-community/"
  sudo cp -dr "${pkgdir}/usr/share/intellij-idea-community/bin/idea.png" "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm 644 intellij-idea-community.desktop -t "${pkgdir}"/usr/share/applications/
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo ln -sf "/usr/share/intellij-idea-community/bin/idea.sh" "${pkgdir}/usr/bin/idea"
}

# vim:set ft=sh ts=2 sw=2 et:
