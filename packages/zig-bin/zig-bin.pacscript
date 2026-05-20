pkgname="zig-bin"
repology=("project: zig")
pkgver="0.16.0"
arch=('amd64' 'arm64')
source_amd64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-x86_64-linux-${pkgver}.tar.xz")
source_arm64=("@${pkgname}~${pkgver}::https://ziglang.org/download/${pkgver}/zig-aarch64-linux-${pkgver}.tar.xz")
sha256sums_amd64=("8eba2de3b35444cb11046495cf2b66542527bc20e1e63caaed42b24f0d90000b")
sha256sums_arm64=("3eb2575c696d3fa778e649216211f39f64c830c47973c6cb4e3a2d73be0840d3")
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
