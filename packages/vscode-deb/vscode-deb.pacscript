pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.132.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")

sha256sums_amd64=("b73e01a1a371eb7d57f2c01712c43e9cedd15d6bad9a44261c4473db946532ef")
sha256sums_arm64=("599196c05788cf5d433556118eaa6a1b89a46683c6d1423aacf4279200533e82")
sha256sums_armhf=("b407506443cb88303c09d428d4a158ffafb24bc74ce2e8f1685d30f55df4a913")
