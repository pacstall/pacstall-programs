pkgname="zig-bin"
repology=("project: zig")
pkgver="0.12.0"
arch=('amd64' 'arm64')
sha256sums_amd64=("c7ae866b8a76a568e2d5cfd31fe89cdb629bdd161fdd5018b29a4a0a17045cad")
sha256sums_arm64=("754f1029484079b7e0ca3b913a0a2f2a6afd5a28990cb224fe8845e72f09de63")
source_amd64=("https://ziglang.org/download/${pkgver}/zig-linux-x86_64-${pkgver}.tar.xz")
source_arm64=("https://ziglang.org/download/${pkgver}/zig-linux-aarch64-${pkgver}.tar.xz")
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal and reusable software"
url='https://ziglang.org/'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  cd "${_archive}"
  install -Dm755 ./zig -t "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/zig/"
  cp -r ./lib/* "${pkgdir}/usr/lib/zig/"
  install -d "${pkgdir}/usr/share/doc/zig"
  cp -r ./doc/* "${pkgdir}/usr/share/doc/zig"
}

# vim:set ft=sh ts=2 sw=2 et:
