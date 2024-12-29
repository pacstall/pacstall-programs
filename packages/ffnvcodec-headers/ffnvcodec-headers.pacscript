pkgname="ffnvcodec-headers"
gives="ffnvcodec-headers"
arch=("all")
pkgver="12.2.72.0"
url='https://git.videolan.org/git/ffmpeg/nv-codec-headers.git'
pkgdesc="FFmpeg version of headers required to interface with Nvidias codec APIs"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
license=('MIT')

source=(
  "@${pkgname}~${pkgver}::https://github.com/FFmpeg/nv-codec-headers/releases/download/n${pkgver}/nv-codec-headers-${pkgver}.tar.gz"
)
sha256sums=(
  "c295a2ba8a06434d4bdc5c2208f8a825285210d71d91d572329b2c51fd0d4d03"
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
