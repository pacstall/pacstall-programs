pkgname="hakuneko-deb"
gives="hakuneko-desktop"
pkgver="8.3.4"
nightly="20200705.1"
arch=("amd64" "arm64" "armhf" "i386")
url='https://github.com/manga-download/hakuneko'
pkgdesc="HakuNeko is a cross-platform downloader for manga and anime from various websites"
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://github.com/manga-download/hakuneko/releases/download/nightly-${nightly}/hakuneko-desktop_${pkgver}_linux_${CARCH}.deb")
sha256sums_amd64=("48e9a77015695fe69390ac99b54184cf793f31c3452d174fcf41052ccb2ae211")
source_arm64=("https://github.com/manga-download/hakuneko/releases/download/nightly-${nightly}/hakuneko-desktop_${pkgver}_linux_${CARCH}.deb")
sha256sums_arm64=("5e4b992b58a67ddac96410975e10577befe67479c1c2b3d12b2bcbaf6f6c003a")
source_armhf=("https://github.com/manga-download/hakuneko/releases/download/nightly-${nightly}/hakuneko-desktop_${pkgver}_linux_${CARCH}.deb")
sha256sums_armhf=("4dabbfa9d775da72499f594bfdda86adc62a5caaa579c73b9d4ccf5d778c903d")
source_i386=("https://github.com/manga-download/hakuneko/releases/download/nightly-${nightly}/hakuneko-desktop_${pkgver}_linux_${CARCH}.deb")
sha256sums_i386=("3608ff4e8a3257fffedfa2dcea6501cb6d0d203235a2e4c6e6bbf01b93dce240")
