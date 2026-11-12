pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.146.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("f83565f7f11a60b256807fe2216da8405f9728f193754959695242eecd148992")
sha256sums_arm64=("ae7c714ee9c80bd98323e53cdf211d3c9249a83f34d78b8fd6cfbc143ba2424f")
sha256sums_armhf=("a28da18dd44cc8709bc3b6e8275df639be958ee859944ac7c03e146e862e06bf")
