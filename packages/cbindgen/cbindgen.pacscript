pkgname="cbindgen"
pkgver="0.29.0"
pkgdesc="A tool for generating C bindings to Rust code"
url='https://github.com/mozilla/cbindgen'
repology=("project: ${pkgname}")
maintainer=("xdavius <xdavius@github.com>")
arch=("amd64" "arm64")
license=("MPL-2.0")
depends=("libglib2.0-dev")
makedepends=("libglib2.0-dev" "git")
pacdeps=("rust-bin")
source=("git+https://github.com/mozilla/cbindgen#tag=v${pkgver}")
b2sums=('76b445f7f9729107a04451433d047f50b5ac52c7dc501685f00d0558dab82e2bc09d23a8b5c33ea231e1a2fae81533ba8e64d21a43d524b6dd0de170114c6ea5')
external_connection="true"

prepare() {
  cd cbindgen
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd cbindgen

  CARGO_PROFILE_RELEASE_DEBUG=2 \
    CARGO_PROFILE_RELEASE_LTO=true \
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
    cargo build --release
}

package() {
  cd cbindgen
  install -Dt "${pkgdir}/usr/bin" target/release/cbindgen
  install -Dt "${pkgdir}/usr/share/doc/${pkgname}" -m644 CHANGES \
    {README,docs,internals}.md
}
