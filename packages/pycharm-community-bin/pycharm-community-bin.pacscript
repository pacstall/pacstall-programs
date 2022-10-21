name="pycharm-community-bin"
version="2022.2.3"
pkgname="pycharm-community"
gives="pycharm-community"
maintainer="Obsidian <emil@aarestrup.nu>"
description="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
url="https://download.jetbrains.com/python/pycharm-community-${version}.tar.gz"
hash="cb03d44599a03419c0c63fc917846fca28c9ea664ed2b2a1c36240dcffb2a387"
desktop_file_sum="0367fc67c51d5d99fd64a5184b8acb2dbed4a56bb26eecdcf25a2414f2233c04"
repology=("project: pycharm")

prepare() {
  wget -qO "pycharm.desktop" "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/pycharm.desktop"
  if [[ "$(sha256sum pycharm.desktop | cut -d' ' -f 1)" != "${desktop_file_sum}" ]]; then
    fancy_message error "Checksum for pycharm.desktop failed"
    return 1
  fi
}

build() {
  true
}

install() {
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/licenses/pycharm"
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/pycharm"
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/pixmaps"
  sudo cp -dr --no-preserve='ownership' bin jbr lib plugins "${STOWDIR}/${name}/usr/share/pycharm/"
  sudo cp -dr --no-preserve='ownership' license "${STOWDIR}/${name}/usr/share/licenses/pycharm/"
  sudo cp -dr "${STOWDIR}/${name}/usr/share/pycharm/bin/pycharm.png" "${STOWDIR}/${name}/usr/share/pixmaps/"
  sudo install -Dm 644 pycharm.desktop -t "${STOWDIR}/${name}"/usr/share/applications/
}

postinst() {
  sudo ln -sf "/usr/share/pycharm/bin/pycharm.sh" "/usr/bin/pycharm"
}

removescript() {
  sudo rm -f /usr/bin/pycharm
}
