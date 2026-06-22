pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.120.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.120.0-1778619059_amd64.deb")
sha256sums_amd64=("86a803d2dc8c019d589a7b6c3ee84f7242b53defd7d0344169a5ba2f9e917c70")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.120.0-1778619063_arm64.deb")
sha256sums_arm64=("3c5b43b529f9082694c305f3e4e474a61714a5908791d9a4673bd934ad49a6d6")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.120.0-1778619055_armhf.deb")
sha256sums_armhf=("bda3cde0deb7a7ec39ca12c1041ea0fb822621512491071e062d6ca6ffb67a39")
