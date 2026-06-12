pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.123.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.123.0-1780481570_amd64.deb")
sha256sums_amd64=("c94076e6855f2e360ff5cf6824a8bb8890fb748f41476e5e4c33f4c54696b70d")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.123.0-1780481584_arm64.deb")
sha256sums_arm64=("48d5d5c1da4898e534fc11694900423c4197a030a09093d8eb93bd3c231415c0")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.123.0-1780481487_armhf.deb")
sha256sums_armhf=("c45930af28de189fc3b3026b5354e687edff10654bd393b64e35bf13990dfac0")
