pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.144.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("b8fbff92d8d95908990eed0acf004c980f29003725469e794ddbd017ea511a20")
sha256sums_arm64=("044e1cfd2ba1a93ff05b1d58f4b720896142c939f862c9a9204c2efe6c87b3af")
sha256sums_armhf=("d59b753be386b65450a393d2b30f6a65a812f8a4664e1da2e8ae0a9e885f58c3")
