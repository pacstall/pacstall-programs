pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.136.1"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("4463c4e249a19d7746603f2ec3745c345d3cd55b009d36e824158d15c35509ef")
sha256sums_arm64=("baa72f92d3feaa76d015202c57271475ea15809e635587279171a972cdd612a4")
sha256sums_armhf=("02ddb5c5cbc2d5f4db25a3d7bb365c60eef0a017fa64b1994b131544677319e3")
