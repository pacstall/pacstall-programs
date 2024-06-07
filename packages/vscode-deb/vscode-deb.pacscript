pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.90.0"
url="https://code.visualstudio.com/"
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1717531825_amd64.deb")
sha256sums_amd64=("8f4a3f4eb9e3da98eef709d3ceb4fb26504200f5d4961591e2279f375ea92063")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1717529971_arm64.deb")
sha256sums_arm64=("5de0d9a4d2cd57dffa57c87b5d3dea7435b2f82b69e4f01d1b6c7f6290d6e9f5")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1717530229_armhf.deb")
sha256sums_armhf=("57d999241bedb65e99be2865b9283cce658308ae9bfc80039fc67c548fd99673")
