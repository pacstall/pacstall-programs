pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.135.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1787669172_amd64.deb")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1787669187_arm64.deb")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1787669032_armhf.deb")
sha256sums_amd64=("e8101720f0a48f8e6ae5a4112d10ffea5f13d298e7d0a7012b4e36eebc53022c")
sha256sums_arm64=("20f1717805ed723c8846e14df3280c6132a663ff71e32068aaa70f3e4c8b1ca4")
sha256sums_armhf=("78e64befb925f85a34239db6e9c9c7c28d368df2ad42e7ff6b2f2876c394a22a")
