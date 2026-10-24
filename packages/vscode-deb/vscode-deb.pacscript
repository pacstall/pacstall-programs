pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.143.1"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("e459729dee13758960924be07157da44f0ba69503ab5edf4586fcde936bac9b9")
sha256sums_arm64=("b5163fe68935a3d11c954de08c2ca953532f1ba70204df1bc95e736c1eea31ff")
sha256sums_armhf=("ee4f0d3da5ff9487733edef736aecfa258af1a8216c090e25f1545ec82928863")
