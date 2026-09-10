pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.137.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("fd4dff72c44598d3acb885b448256f5d82cf53f59538d97fc7d3c8d8d9d574d3")
sha256sums_arm64=("8bff558a659d351328f5a1e319802073b59dac42f95cc0f9b2ef1b0c27387431")
sha256sums_armhf=("b86cdd666e972a5a555d34298c91239bcbaada69ee882c4a36fe1e74d1df2070")
