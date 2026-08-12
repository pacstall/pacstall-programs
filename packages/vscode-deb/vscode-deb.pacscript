pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.132.1"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("da17f465d8c33add5affe157a2c0a0b8a2c0af11b63804d055b853be04ddbfc9")
sha256sums_arm64=("cb4b5a0732eb85f8764933616ffdae922c9d160647b427f9409a5686ecc4a6bd")
sha256sums_armhf=("366fa305fb6a7b2e0a4b8569568e66f314df6eacf1f005d2099aec4af33c90b3")
