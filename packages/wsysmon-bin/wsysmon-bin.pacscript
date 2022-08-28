maintainer="0x262D <pacstall@copypaste.anonaddy.me>"

name="wsysmon-bin"
pkgname="wsysmon"
gives="wsysmon"
version="0.1.0"
description="A windows task manager clone for Linux"
url="https://github.com/SlyFabi/WSysMon/releases/download/${version}/WSysMon"
hash="ef57a20064c7d97c437cbce19e20f78638430e08bc7c9933cc876e83114fce58"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-git"
pkgdir="${STOWDIR}/${name}"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install appimage
  sudo install -Dm755 "WSysMon" "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
