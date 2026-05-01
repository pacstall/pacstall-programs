pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.118.1"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.118.1-1777474985_amd64.deb")
sha256sums_amd64=("ace6f418c2b034a33629784fb75b74c4dfe9a7edf84eba3b88540f74595c65a1")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.118.1-1777474997_arm64.deb")
sha256sums_arm64=("03a08f166a604ef6783fb96ecc8495a6bb236232dd2fb87c2d7555ee7f7901e4")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.118.1-1777474990_armhf.deb")
sha256sums_armhf=("c360943fea0bba1f5a3d071b277edc7dcc7ea69ea830de90350e789caebfec45")
