pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.133.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("d064e87e22f556b8a91e1354b5227e340597324e52886dbb288551596b00e34a")
sha256sums_arm64=("b20bfb21c5b3656e3411391c5c18df1782aedd7cd3bda0b9c08363ea261fca4b")
sha256sums_armhf=("f68acc6874f59d829779d82e259cfb339ca168b5707f406cfc262353e5d34e45")
