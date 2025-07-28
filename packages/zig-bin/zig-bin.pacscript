pkgname="zig-bin"
repology=("project: zig")
pkgver="0.14.1"
arch=('amd64' 'arm64')
source_amd64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-x86_64-linux-${pkgver}.tar.xz")
source_arm64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-aarch64-linux-${pkgver}.tar.xz")
sha256sums_amd64=("24aeeec8af16c381934a6cd7d95c807a8cb2cf7df9fa40d359aa884195c4716c")
sha256sums_arm64=("f7a654acc967864f7a050ddacfaa778c7504a0eca8d2b678839c21eea47c992b")
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
