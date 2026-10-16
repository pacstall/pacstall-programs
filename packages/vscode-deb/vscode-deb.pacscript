pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.142.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("33454f7d2d7bc79a5925b3e794d106fb454a10c6a635ddfeb908a63659a44ec5")
sha256sums_arm64=("036b445fe4c634f0917cb0d09f4ce43048da1b2797d3fd2169c645ea9a261af8")
sha256sums_armhf=("a2fd8d9458dc9443761d9970b68782897f14cf41e9dae0a74b58869c748b673b")
