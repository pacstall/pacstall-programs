pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.122.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.122.0-1779917575_amd64.deb")
sha256sums_amd64=("fc109ec3258b8d352ec18d6a8c3bca448760e1d963d1e078bdb8732a5a6320af")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.122.0-1779917571_arm64.deb")
sha256sums_arm64=("e4ef06f9b62a3380e37ad825d1e6fec1f8e530621246cb46b1dd22dfe5dffc1b")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.122.0-1779917571_armhf.deb")
sha256sums_armhf=("d2da074d4c02430e5115b915a4ca4ed6bb41f90e982493127444a82efe117b62")
