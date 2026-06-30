pkgname="ffnvcodec-headers"
gives="ffnvcodec-headers"
arch=("all")
pkgver="13.0.19.0"
url='https://git.videolan.org/git/ffmpeg/nv-codec-headers.git'
pkgdesc="FFmpeg version of headers required to interface with Nvidias codec APIs"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
license=('MIT')

source=(
  "@${pkgname}~${pkgver}::https://github.com/FFmpeg/nv-codec-headers/releases/download/n${pkgver}/nv-codec-headers-${pkgver}.tar.gz"
)
sha256sums=(
  "13da39edb3a40ed9713ae390ca89faa2f1202c9dda869ef306a8d4383e242bee"
)

makedepends=(
  'git'
)
depends=()
optdepends=()

build() {
  cd "${pkgname}~${pkgver}"
  make PREFIX=/usr
  sed -n '4,25p' include/ffnvcodec/nvEncodeAPI.h > LICENSE # Extract license
  sed -i '1,22s/^.\{,3\}//' LICENSE                        # Delete C comments
}

package() {
  cd "${pkgname}~${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/ffnvcodec-headers/
}
