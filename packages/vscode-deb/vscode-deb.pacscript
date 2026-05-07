pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.119.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.119.0-1778006717_amd64.deb")
sha256sums_amd64=("39be7a2c3f95bd933a8c804d12aa22a8053328b7cd04384e6af40e971c38e18b")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.119.0-1778006730_arm64.deb")
sha256sums_arm64=("cd9a8885090484aa02bcb0cb4ce65b59bd5414aeaa8d3398fb3b66c958939f8b")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.119.0-1778006718_armhf.deb")
sha256sums_armhf=("d577d634f0d84a6acfbf9e99bbd90943a2ccec2277e1d48d5dd76db63668bb65")
