pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.141.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("d0ff4f7702957d897d2e06956f8d42a08250c5df8339de3bec8190e56f726277")
sha256sums_arm64=("873d5dac55b7cdb4f0af7172187ae3cc1709f6250331524ad41f1136589e62f2")
sha256sums_armhf=("7acd1ab485048de64ed2ef992538a6499e19e95b16aef3202a554a7736af166d")
