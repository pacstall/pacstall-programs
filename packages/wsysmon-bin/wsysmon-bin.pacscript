maintainer=("0x262D <pacstall@copypaste.anonaddy.me>")
pkgname="wsysmon-bin"
gives="wsysmon"
arch=("amd64")
pkgver="0.1.0"
pkgdesc="A windows task manager clone for Linux"
source=(
  "https://github.com/SlyFabi/WSysMon/releases/download/${pkgver}/WSysMon"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
sha256sums=(
  "ef57a20064c7d97c437cbce19e20f78638430e08bc7c9933cc876e83114fce58"
  "SKIP"
)
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  # Install appimage
  install -Dm755 "WSysMon" "${pkgdir}/usr/bin/${gives}"

  # Install .desktop file
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
