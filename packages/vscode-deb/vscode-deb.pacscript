pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.109.4"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1771257466_amd64.deb")
sha256sums_amd64=("693451149c02f72f8d346e7e5c30afb80ab1f0d175a7ecf7c3ced0900bb83507")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1771257672_arm64.deb")
sha256sums_arm64=("742a44c2e0e8fd1c09dcf23f5527407956f3abafef31735d00e69d8b770058d6")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1771257673_armhf.deb")
sha256sums_armhf=("18cb079ed6f71f668c546d67cc35e6d2a9f6eef7baddc0909e2e62094b299d36")
