name="authy-bin"
pkgname="authy"
description="Two factor authentication desktop application"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
gives='authy'
breaks='authy-snap'
replaces='authy-snap'
build_depends='squashfs-tools'
depends='appmenu-gtk3-module libayatana-appindicator3-1'
_snapid="H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn"
_snaprev="10"
version="2.2.0"
url="https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
hash='b01f7f7d557faa9f837e3c69bf32141ec2e4784bb7e62dab12fd7f258332b46f'

prepare() {
  true
}

build() {
  sudo unsquashfs "${_snapid}_${_snaprev}.snap"
}

install() {
  sudo install -d "${STOWDIR}/${name}"
  sudo chmod -R +x "${STOWDIR}/${name}"
  sudo sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "${PWD}"/squashfs-root/meta/gui/authy.desktop
  sudo sed -i 's|Exec=authy \%U|Exec=cd /usr/src/pacstall/authy-bin \&\& ./authy|g' "${PWD}"/squashfs-root/meta/gui/authy.desktop
  sudo install -Dm644 "${PWD}"/squashfs-root/meta/gui/authy.desktop "${STOWDIR}/${name}/usr/share/applications/authy.desktop"
  sudo install -Dm644 "${PWD}"/squashfs-root/meta/gui/icon.png "${STOWDIR}/${name}/usr/share/pixmaps/authy.png"
  sudo rm -rf "${PWD}"/squashfs-root/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}
  sudo cp -r "${PWD}"/squashfs-root/* "${STOWDIR}/${name}"
}
