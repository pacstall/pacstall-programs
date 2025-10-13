pkgname="zig-bin"
repology=("project: zig")
pkgver="0.15.2"
arch=('amd64' 'arm64')
source_amd64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-x86_64-linux-${pkgver}.tar.xz")
source_arm64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-aarch64-linux-${pkgver}.tar.xz")
sha256sums_amd64=("02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239")
sha256sums_arm64=("958ed7d1e00d0ea76590d27666efbf7a932281b3d7ba0c6b01b0ff26498f667f")
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
