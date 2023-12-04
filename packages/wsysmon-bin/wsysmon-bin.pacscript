maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="wsysmon-bin"
gives="wsysmon"
pkgver="0.1.0"
pkgdesc="A windows task manager clone for Linux"
url="https://github.com/SlyFabi/WSysMon/releases/download/${pkgver}/WSysMon"
hash="ef57a20064c7d97c437cbce19e20f78638430e08bc7c9933cc876e83114fce58"
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  # Install appimage
  sudo install -Dm755 "WSysMon" "${pkgdir}/usr/bin/${gives}"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${gives}.desktop"
  sudo install -Dm644 "${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
