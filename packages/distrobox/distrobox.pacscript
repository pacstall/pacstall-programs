name="distrobox"
version="1.2.14"
repology=("project: distrobox")
description="Use any linux distribution inside your terminal."
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
url="https://github.com/89luca89/distrobox/archive/refs/tags/${version}.tar.gz"
gives="distrobox"
breaks="${gives} ${gives}-git ${gives}-bin"
hash="86c7a6515d8548e258b4acb152e4a622f671c4ffcf1cc1a36d05b5f56bc6a0aa"
prepare() {
  sudo mkdir -p "/usr/src/pacstall/distrobox/usr"
}

install() {
sudo chmod +x ./install
sudo ./install --prefix "/usr/src/pacstall/distrobox/usr"
sudo chmod a=rwx "/usr/src/pacstall/distrobox/usr" --recursive
}
