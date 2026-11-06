pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.145.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("64cb445811a347df1b5118a17117cfd5ac0ab7e2cc41832351b938364d17cacd")
sha256sums_arm64=("da4c873ae450a5da60c55e409a15672c01baacfe5d36e2d4b56b06ea0db14c41")
sha256sums_armhf=("e1ac7767c1941eb551cf838aef2eaccd6715410bc3516873cf38a11a8974cd71")
