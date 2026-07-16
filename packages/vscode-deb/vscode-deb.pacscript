pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.129.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1784074987_amd64.deb")
sha256sums_amd64=("a25c73aa4a7461d3d605f272add35fd661c881400c75b4809d6cb277632791c4")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1784074986_arm64.deb")
sha256sums_arm64=("c228f157e6febac1ab503ebab1f89c78420172594c775f76fca95000c0817e97")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1784074902_armhf.deb")
sha256sums_armhf=("883338ba1f35ba65fc4f0c288c00acaa17fcba89b22e082747a373b4132a78a1")
