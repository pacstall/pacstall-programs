pkgname="ffnvcodec-headers"
gives="ffnvcodec-headers"
pkgver="12.2.72.0"
url='https://git.videolan.org/git/ffmpeg/nv-codec-headers.git'
pkgdesc="FFmpeg version of headers required to interface with Nvidias codec APIs"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
license=('MIT')

source=(
  "https://github.com/FFmpeg/nv-codec-headers/releases/download/n${pkgver}/nv-codec-headers-${pkgver}.tar.gz"
)
sha256sums=("SKIP")

makedepends=(
  'git'
)
depends=()
optdepends=()

build() {
  cd "${_archive}"
  make PREFIX=/usr
  sed -n '4,25p' include/ffnvcodec/nvEncodeAPI.h > LICENSE # Extract license
  sed -i '1,22s/^.\{,3\}//' LICENSE                        # Delete C comments
}

package() {
  cd "${_archive}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/ffnvcodec-headers/
}
