pkgname="vscode-insiders-deb"
arch=("amd64" "arm64" "armhf")
gives="code-insiders"
pkgver="1.91.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode-insiders")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgver}-1717654436_amd64.deb")
sha256sums_amd64=("747c589e5fc458c4004185b2a5c816a7d9055c74f9aa8e3c0d4d615be2e66889")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgver}-1717652909_arm64.deb")
sha256sums_arm64=("075f577a73a79dce72b126c5c4d64e2060bbed1375d20a0a6feaf62ceff67e7b")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgver}-1717653048_armhf.deb")
sha256sums_armhf=("dc8558b31b521886cc779f9fd2c7cf5d292efe8b9f20cca3a77b8ea05d55970e")
