pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.128.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1783465401_amd64.deb")
sha256sums_amd64=("ee7ff012cf872e497d665486e56c5b1a12e36cca0c07c97887c997cbfdc797b1")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1783465398_arm64.deb")
sha256sums_arm64=("eb394338250dc7f5371c8c8e6a26d632c7aa977843d6ee7a496132c301a8ea05")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1783465303_armhf.deb")
sha256sums_armhf=("230d782d05d84ac82ed1a8b6c5b0d209714c0eb792d87838f1111d9120152091")
