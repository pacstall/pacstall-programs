pkgname="zig-bin"
repology=("project: zig")
pkgver="0.16.0"
arch=('amd64' 'arm64')
source_amd64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-x86_64-linux-${pkgver}.tar.xz")
source_arm64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-aarch64-linux-${pkgver}.tar.xz")
sha256sums_amd64=("70e49664a74374b48b51e6f3fdfbf437f6395d42509050588bd49abe52ba3d00")
sha256sums_arm64=("ea4b09bfb22ec6f6c6ceac57ab63efb6b46e17ab08d21f69f3a48b38e1534f17")
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal and reusable software"
url='https://ziglang.org/'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 ./zig -t "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/zig/"
  cp -r ./lib/* "${pkgdir}/usr/lib/zig/"
  install -d "${pkgdir}/usr/share/doc/zig"
  cp -r ./doc/* "${pkgdir}/usr/share/doc/zig"
}

# vim:set ft=sh ts=2 sw=2 et:
