pkgname="zig-bin"
repology=("project: zig")
pkgver="0.11.0"
arch=('amd64' 'arm64')
sha256sums_amd64=("2d00e789fec4f71790a6e7bf83ff91d564943c5ee843c5fd966efc474b423047")
sha256sums_arm64=("956eb095d8ba44ac6ebd27f7c9956e47d92937c103bf754745d0a39cdaa5d4c6")
if [[ ${CARCH} == amd64 ]]; then
    url_arch="x86_64"
else
    url_arch="aarch64"
fi
source=("https://ziglang.org/download/${pkgver}/zig-linux-${url_arch}-${pkgver}.tar.xz")
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal and reusable software"
homepage='https://ziglang.org/'
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
