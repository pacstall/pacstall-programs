name="pycharm-community-bin"
version="2022.1"
pkgname="pycharm-community"
gives="pycharm-community"
maintainer="Obsidian <emil-aarestrup@outlook.dk>"
description="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
url="https://download.jetbrains.com/python/pycharm-community-${version}.tar.gz"
hash="35d857df0ac4bd76caba60ac329c9183594be142094d0592f2afa40534be85eb"
desktop_file_sum="5d2d1a3bf3d81cb7b7fef2d8332932eb9133f89b823ea291551267484e69d74f"

prepare() {
  wget -qO "pycharm.desktop" "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/pycharm.desktop"
  if [[ "$(sha256sum pycharm.desktop | cut -d' ' -f 1)" != "${desktop_file_sum}" ]]; then
    fancy_message error "Checksum for PyCharm.desktop failed"
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
  sudo ln -s "/usr/share/pycharm/bin/pycharm.sh" "/usr/bin/pycharm"
  sudo install -Dm 644 PyCharm.desktop -t "${STOWDIR}/${name}"/usr/share/applications/
}
