pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.139.1"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("cc8e35cf69ff4c7e515e19fa981bf6aba41f61ddb61c79370e9fe460c5dbaf8b")
sha256sums_arm64=("53cdf61fd870ec9663ea7baa5e4f79014acafc36d8c45b2678a8ce80d72d737d")
sha256sums_armhf=("09afa2bcd369ce7a8231a297bed487a9f7aa1ba3776cdac3bfd481d1bb08b708")
