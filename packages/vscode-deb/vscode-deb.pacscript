pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.147.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("749efcdf5008a8323d76773b836199cdecf708fdb993f0f0544d9475176837ab")
sha256sums_arm64=("13b65c06a51f573db750878fa671cd89701b5f628e73d5309b7b0c2884814101")
sha256sums_armhf=("467450ee5f046663bff4e0191c772a18765b729a04a8c63ac02e4770d092a8ac")
