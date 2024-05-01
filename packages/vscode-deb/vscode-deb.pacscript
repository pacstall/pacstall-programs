pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.85.0"
url="https://code.visualstudio.com/"
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1701902998_amd64.deb")
sha256sums_amd64=("915b82483992df127d3c03835cbec37cc88724508d2e2a1fd93ec034e77ec26e")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1701895805_arm64.deb")
sha256sums_arm64=("a052f4febb6067a477977c9702a230fe21e6db62f670be3440312840c3a7a40e")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1701886704_armhf.deb")
sha256sums_armhf=("4e87b5d3ab155fdb1826f21a058c2a5f20b392f6d0c90a8576dc92a3fdabea1b")
