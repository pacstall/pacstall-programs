pkgname="hello-rhino-bin"
depends=("libssl-dev" "gettext")
gives="hello-rhino"
pkgdesc="Rhino Linux Welcome Screen"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgver="2025.1-1"
pkgrel="2"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
sha256sums_arm64=("b63080659292f31546c36c7aa0517a4c8862684f4737039f8c2cf0b0e8f732e9")
sha256sums_amd64=("aa58b85e5f20a54ed2b3946d171f1e07bbb2df486b8cf4d67063809dc7aa4777")
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
