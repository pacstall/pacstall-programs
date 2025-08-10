pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.103.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1754517494_amd64.deb")
sha256sums_amd64=("46c4b9c83e5ea7ae1fbdcac679c39de878c50c1ec3bc73a7fc2e384823b559ae")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1754517464_arm64.deb")
sha256sums_arm64=("86f17a8a3a7a82977a40995eccad33e8386d9c56f49289aa393b7de6d6fdeb9f")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1754517463_armhf.deb")
sha256sums_armhf=("f4cfbb3bdd5968e537638863e53f89698838cf617e17224fa5bbd374ce5cb1b2")
