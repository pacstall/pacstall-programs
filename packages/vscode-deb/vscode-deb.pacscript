pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.140.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("e5ddfa528d68ce907c92cba18ed4edd7420874fe828cbaaf8e4484aa33530c3b")
sha256sums_arm64=("e48fc67195d140081bf9363d34dabf07d348e3bf1e78380dfd6abb11e346a9c3")
sha256sums_armhf=("0dac80330756b08d9bd586f79e5cb167019f6fa513a752321ce83cdd0a138c44")
