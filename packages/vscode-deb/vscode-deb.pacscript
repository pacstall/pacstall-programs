pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.125.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1781601565_amd64.deb")
sha256sums_amd64=("7538e2b63e3a32927f7874f4790bbddb60088c80db5c737f907fce5ae56f0462")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1781601584_arm64.deb")
sha256sums_arm64=("58fff22a824910c9aa065da7187242b250555b8ca4e2e1503631769c64c0d549")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1781601484_armhf.deb")
sha256sums_armhf=("2685bbbde0f4702e1c76a5204fb52874837b2181e2dbe56d08b688a0634b4b09")
