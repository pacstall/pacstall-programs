pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.136.2"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("2493226f723f66c8e83b9d806e3fbe83dcc43f381ece51eaa03d88889542b0c0")
sha256sums_arm64=("2e6f3289ddd418ac3a80c37d617f59afd101a245edc99c98782d5297f2812f70")
sha256sums_armhf=("075a239fd7f515c78117f4d52a0cbdff0c29b7e489c2906e818e47f329f390d5")
