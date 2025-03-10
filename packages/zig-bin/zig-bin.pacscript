pkgname="zig-bin"
repology=("project: zig")
pkgver="0.14.0"
arch=('amd64' 'arm64')
sha256sums_amd64=("473ec26806133cf4d1918caf1a410f8403a13d979726a9045b421b685031a982")
sha256sums_arm64=("ab64e3ea277f6fc5f3d723dcd95d9ce1ab282c8ed0f431b4de880d30df891e4f")
source_amd64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-linux-x86_64-${pkgver}.tar.xz")
source_arm64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-linux-aarch64-${pkgver}.tar.xz")
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
