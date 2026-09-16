pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.138.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("73389cdcef7e66171a2039d1e49b9530e5ed02937e6159d3e6af93484e63cbad")
sha256sums_arm64=("09760b73fb96ca19f8c6e483ec5b69123f34edd2c762cc9e0faf73fa3d400145")
sha256sums_armhf=("bb74a3023aced544c71d4274d5942ce69c59a2ec0ffaf9094fa7c0fddb506366")
