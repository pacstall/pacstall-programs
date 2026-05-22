pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.121.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.121.0-1779186519_amd64.deb")
sha256sums_amd64=("a9ee29ba18142b99c10bbcbaf7c9447f5dd59bc1ffcc3be1ccb64587e2230d73")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.121.0-1779186523_arm64.deb")
sha256sums_arm64=("1ce853ad6b839b9a0568261f93ce2a02e9de362a62a4d133d8b329bc332057ca")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.121.0-1779186507_armhf.deb")
sha256sums_armhf=("ee6a13b6e4eb479b69e64d30c464816414f7071e111920e6fab987c63fdc7e40")
