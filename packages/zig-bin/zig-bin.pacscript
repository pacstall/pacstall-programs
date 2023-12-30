name="zig-bin"
repology=("project: zig")
pkgver="0.11.0"
arch=('amd64' 'arm64')
if [[ ${CARCH} == amd64 ]]; then
    hash="2d00e789fec4f71790a6e7bf83ff91d564943c5ee843c5fd966efc474b423047"
    url_arch="x86_64"
else
    hash="956eb095d8ba44ac6ebd27f7c9956e47d92937c103bf754745d0a39cdaa5d4c6"
    url_arch="aarch64"
fi
url="https://ziglang.org/download/${pkgver}/zig-linux-${url_arch}-${pkgver}.tar.xz"
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal and reusable software"
homepage='https://ziglang.org/'
maintainer="Andrew Barchuk <andrew@raindev.io>"

package() {
  sudo install -Dm755 ./zig -t "${pkgdir}/usr/bin"
  sudo install -d "${pkgdir}/usr/lib/zig/"
  sudo cp -r ./lib/* "${pkgdir}/usr/lib/zig/"
  sudo install -d "${pkgdir}/usr/share/doc/zig"
  sudo cp -r ./doc/* "${pkgdir}/usr/share/doc/zig"
}

# vim:set ft=sh ts=2 sw=2 et:
