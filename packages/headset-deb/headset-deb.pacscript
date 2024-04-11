pkgname="headset-deb"
pkgver="4.2.1"
source=("https://github.com/headsetapp/headset-electron/releases/download/v${pkgver}/headset_${pkgver}_amd64.deb")
pkgdesc="Discover and collect music on YouTube Headset is a desktop app that turns YouTube into a world class music streaming service"
sha256sums=("f3582c22aef8b2081ab84ea0f2933acf4e4a4e6b1b7b8f4265af5a450103c0ca")
arch=('amd64')
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: headset")

post_install() {
  sudo rm -f /etc/apt/sources.list.d/headset.list
}
