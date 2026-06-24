pkgname="jq-bin"
gives="jq"
arch=("amd64" "arm64" "armel" "armhf" "i386" "ppc64el" "riscv64" "s390x")
pkgver="1.8.2"
repology=("project: ${gives}")
license=("MIT")
url='https://jqlang.org/'
source=(
  "https://github.com/jqlang/${gives}/releases/download/${gives}-${pkgver}/${gives}-linux-${CARCH}"
  "https://raw.githubusercontent.com/jqlang/jq/refs/tags/jq-${pkgver}/jq.1.prebuilt"
)
pkgdesc="Lightweight and flexible command-line JSON processor"
maintainer=("Don Alfons <donnisnoni@outlook.com>")
makedepends=("gzip")
sha256sums_amd64=("b1c22172dd303f3be49e935aa56aa48a8b7a46e0bc838b4997d3bb451495870f")
sha256sums_arm64=("8b85c817833814ddca00a144c33705546355afccf0cf39b188f3cdb48b852309")
sha256sums_armel=("d88f6bd640ef8909b3deb587f12c03a0ed38fe8bd5e2e882e2b1bf88f5dab8d2")
sha256sums_armhf=("78458244fb546469b4042e9e07cf78714ef6848895eb9515df76b4eb0b1dc992")
sha256sums_i386=("ba996e8ce436973e2f39e2639405a37e8c81ba8c722b71c83996278ad0af16dd")
sha256sums_ppc64el=("0dba61281e525ced2111bc00c8bd8078100e8822c33bfb35feee95314bbeeea2")
sha256sums_riscv64=("a96e5a78a7b2c5a0575bc2a10dda4b20d84efd8c02c8806539ee5f5e57603e8d")
sha256sums_s390x=("42b3306c786e3352e3097b8aa03ca0e5631bdc7a6bf133bb8ddd9e4b148d20c8")

package() {
  install -Dm755 "${gives}-linux-${CARCH}" -T "${pkgdir}/usr/bin/jq"
  install -Dm644 "jq.1.prebuilt" -T "${pkgdir}/usr/share/man/man1/jq.1"
  gzip -9n "${pkgdir}/usr/share/man/man1/jq.1"
}
