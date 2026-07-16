pkgname="sesh-bin"
gives="sesh"
pkgver="2.27.0"
pkgdesc="Smart tmux session manager"
repology=("project: ${gives}")
arch=('arm64' 'amd64' 'i386')
depends=("zoxide")
makedepends=('gzip')
sha256sums_amd64=("199e3352655d6300cce7d16b99bf9dbca944158b2f210c97cb418aff6ec4623c")
sha256sums_arm64=("b68513f96ed358073cbcf79e1b0cba07215fe9c2c722244b286bc05dac71eeea")
sha256sums_i386=("adb29ebdc0f4a801a0d3f83d00dec20f3ad07a55f28b12fcb56d3a8a5c37f5e7")
source_amd64=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_x86_64.tar.gz")
source_arm64=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_arm64.tar.gz")
source_i386=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_i386.tar.gz")
maintainer=("Don Alfons <donnisnoni@outlook.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 sesh -t "${pkgdir}/usr/bin"
  install -Dm644 share/man/man1/sesh.1 -t "${pkgdir}/usr/share/man/man1"
  gzip -9n "${pkgdir}/usr/share/man/man1/sesh.1"
}
