pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.134.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("dcd3a2f52d53df079cd389662ff1fdbeb629938331d3a63655fed929f8d49f19")
sha256sums_arm64=("b30f5bda4855231681cc7fe22d4a59e7dbee2be170b0e4fb04c7e83b9f9affe5")
sha256sums_armhf=("01460717d4f4c7b3109cc06b8df5ba579e98ea373751cc0ed4ae7928f26fad89")
