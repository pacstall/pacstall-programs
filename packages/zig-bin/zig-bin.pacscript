pkgname="zig-bin"
repology=("project: zig")
pkgver="0.13.0"
arch=('amd64' 'arm64')
sha256sums_amd64=("d45312e61ebcc48032b77bc4cf7fd6915c11fa16e4aad116b66c9468211230ea")
sha256sums_arm64=("041ac42323837eb5624068acd8b00cd5777dac4cf91179e8dad7a7e90dd0c556")
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
