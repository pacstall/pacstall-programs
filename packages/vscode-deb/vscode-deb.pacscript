pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.144.1"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("6ea99a41d03b62a5c6658bab66f12210322ebe4214dfa5f0bf1a3ca97501b848")
sha256sums_arm64=("799be313359c09cb91dd32b2b7c951497a6cb5d423a0950d074a870828ca3465")
sha256sums_armhf=("b9370f4963b9b653aa4906d3ec4d3f1c044531dba2210632b89929266a7bda9d")
