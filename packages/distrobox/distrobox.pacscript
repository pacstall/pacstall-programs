name="distrobox"
version=""
description=""
maintainer="cat-master21 <>"
url="https://raw.githubusercontent.com/89luca89/distrobox/main/install"
gives="distrobox"
breaks="${gives} ${gives}-git ${gives}-bin"
hash="1d6db09a44b4d7ea3ee0f942fa52ae8f288efb2db65f915b56a9cf37da8400e0"
prepare() {
  sudo mkdir -p "/usr/src/pacstall/distrobox/usr"
  sudo chmod a=rwx "/usr/src/pacstall/distrobox/usr"
}

install() {
sudo chmod +x ./install
./install --prefix "/usr/src/pacstall/distrobox/usr"
}
