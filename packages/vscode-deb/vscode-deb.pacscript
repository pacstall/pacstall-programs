pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.99.2"
url="https://code.visualstudio.com/"
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1744250061_amd64.deb")
sha256sums_amd64=("8f6b53f866c1afb35e61b52d99bc83f2e5959eee41d80bb69996a31169957f90")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1744249215_arm64.deb")
sha256sums_arm64=("20e7ef599021a6ae187b5393806dcdbf697e870494c7b0f445d26fe7162449df")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1744249094_armhf.deb")
sha256sums_armhf=("69595d157083055b17f0c5614e885c0e53ccef677ced2b738d4c5a60213dbd43")
