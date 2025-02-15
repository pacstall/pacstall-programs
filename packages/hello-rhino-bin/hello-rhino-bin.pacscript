pkgname="hello-rhino-bin"
depends=("libssl-dev" "gettext")
gives="hello-rhino"
pkgdesc="Rhino Linux Welcome Screen"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgver="2025.2"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
sha256sums_arm64=("02270bf1eb90249b8e8f2158e6741b9c7cb34d17b6f85d32b42900568a6c74f0")
sha256sums_amd64=("8e444c0fd42ae4235f48ae6a89146700d18085a7a0bedfd88bd9ebb7c8af7aa5")
source=("https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip")

package() {
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/etc/skel/.config/autostart"
  chmod +x "usr/local/bin/${gives}"
  cp -rf usr/* "${pkgdir}/usr"
  ln -sf "/usr/local/share/applications/hello-rhino.desktop" "${pkgdir}/etc/skel/.config/autostart/hello-rhino.desktop"
}

post_install() {
  mkdir -p "${homedir}/.config/autostart"
  if ! [[ -f "${homedir}/.config/autostart/hello-rhino.desktop" ]]; then
    sudo cp "/usr/local/share/applications/hello-rhino.desktop" "${homedir}/.config/autostart/hello-rhino.desktop"
    sudo chown "${PACSTALL_USER}" "${homedir}/.config/autostart/hello-rhino.desktop"
  fi
}

post_remove() {
  if [[ -f "${homedir}/.config/autostart/hello-rhino.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/hello-rhino.desktop"
  fi
}
