pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.143.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("f045a886dbfd1aa47ec49dd6880d79a95570c9afde627510897b5cf692db5f2a")
sha256sums_arm64=("f2e0ffb9f370b46b8ddbe49fa099f436e9f6344579ddd15a534bc7825ab4ed98")
sha256sums_armhf=("92f66d304dd526ccadf63c6d2098347e23a2dcfa2f2e334915612f5787d2845a")
