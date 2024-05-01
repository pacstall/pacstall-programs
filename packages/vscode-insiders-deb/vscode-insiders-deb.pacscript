pkgname="vscode-insiders-deb"
arch=("amd64" "arm64" "armhf")
gives="code-insiders"
pkgver="1.81-insiders"
pkgversion="1.81.0"
url="https://code.visualstudio.com/"
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode-insiders")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1689659743_amd64.deb")
sha256sums_amd64=("e4c764ecd3c76ebd2e21a20372270b7f06d37826c6c2e25201f728817bdb8617")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1689659758_arm64.deb")
sha256sums_arm64=("96148a657e7b4789fced1cf72d4f6c06a7b9bef06bd83028146a8d4108ba96cd")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1689659148_armhf.deb")
sha256sums_armhf=("fd3c6be35264605b2ef1d4bb10b6ff8837abf0cdbb99c83a4620970daebf9379")
