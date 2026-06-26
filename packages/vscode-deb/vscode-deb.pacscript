pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.126.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1782208079_amd64.deb")
sha256sums_amd64=("230ccba54f577e2a560b6710405f15cd6deaa78364cd0e3a426ef202a27c65f9")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1782208023_arm64.deb")
sha256sums_arm64=("91a808b16ca326eac1b87f1c21963f01233548df72828b9a8bddc9604c589bfb")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1782207887_armhf.deb")
sha256sums_armhf=("2a1aefd05b83ae0c8464a8f5586681f6f6b30a2346527d86602c598733000998")
