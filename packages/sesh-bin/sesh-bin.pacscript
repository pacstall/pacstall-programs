pkgname="sesh-bin"
gives="sesh"
pkgver="2.28.0"
pkgdesc="Smart tmux session manager"
repology=("project: ${gives}")
arch=('arm64' 'amd64' 'i386')
depends=("zoxide")
makedepends=('gzip')
sha256sums_amd64=("ac4a0b07f0be4cbb13691a197055ac82e00341e77b915d878df8ad2bcc867fda")
sha256sums_arm64=("30249b47a0f60a2da557ecde76c169d0dbc82161b12aa46f9ed47af27a265dc6")
sha256sums_i386=("84ebd55f4336dbaa2e307614e9b2a96eebebb45ae90dc5629d185e47c6ab9834")
source_amd64=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_x86_64.tar.gz")
source_arm64=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_arm64.tar.gz")
source_i386=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_i386.tar.gz")
maintainer=("Don Alfons <donnisnoni@outlook.com>")

package() {
  install -Dm755 sesh -t "${pkgdir}/usr/bin"
  install -Dm644 share/man/man1/sesh.1 -t "${pkgdir}/usr/share/man/man1"
  gzip -9n "${pkgdir}/usr/share/man/man1/sesh.1"
}
