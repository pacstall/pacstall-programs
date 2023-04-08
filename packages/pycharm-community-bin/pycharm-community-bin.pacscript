name="pycharm-community-bin"
version="2023.1"
pkgname="pycharm-community"
gives="pycharm-community"
maintainer="ObsidianPresidium <emil@aarestrup.nu>"
description="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
url="https://download.jetbrains.com/python/pycharm-community-${version}.tar.gz"
hash="e8e9ed964ef8a397ad920ccaad41b30c3f29a2e125e7a5c4be50db791099e068"
desktop_file_sum="0367fc67c51d5d99fd64a5184b8acb2dbed4a56bb26eecdcf25a2414f2233c04"
repology=("project: pycharm")

prepare() {
  wget -qO "pycharm.desktop" "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/pycharm.desktop"
  if [[ "$(sha256sum pycharm.desktop | cut -d' ' -f 1)" != "${desktop_file_sum}" ]]; then
    fancy_message error "Checksum for pycharm.desktop failed"
    return 1
  fi
}

install() {
  sudo mkdir -p "${pkgdir}/usr/share/licenses/pycharm"
  sudo mkdir -p "${pkgdir}/usr/share/pycharm"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps"
  sudo cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}/usr/share/pycharm/"
  sudo cp -dr --no-preserve='ownership' license "${pkgdir}/usr/share/licenses/pycharm/"
  sudo cp -dr "${pkgdir}/usr/share/pycharm/bin/pycharm.png" "${pkgdir}/usr/share/pixmaps/"
  sudo install -Dm 644 pycharm.desktop -t "${pkgdir}"/usr/share/applications/
}

postinst() {
  sudo ln -sf "/usr/share/pycharm/bin/pycharm.sh" "/usr/bin/pycharm"
}

removescript() {
  sudo rm -f /usr/bin/pycharm
}
