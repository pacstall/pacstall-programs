pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.136.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1788342447_amd64.deb")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1788342618_arm64.deb")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1788342292_armhf.deb")
sha256sums_amd64=("7cc48f2cd51640c7c098740fa3f566dcbdbe5b47e91e86aaecec9d109e3631d3")
sha256sums_arm64=("f92d9cf4602efe15107bca44b47e9a16765829c755b60c3c1f3975e551798618")
sha256sums_armhf=("aabb727fa1914c90dd8f50aa90d3079a63d3fac09fe4219ccf634b3867644eb1")
