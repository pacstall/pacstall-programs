pkgname="rust-bin"
gives="rust"
pkgver="1.96.0"
pkgdesc="Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety"
arch=("x86_64" "aarch64" "i686")
repology=("project: rust")
url='https://www.rust-lang.org/'
source_x86_64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("c295047583a56238ea06b43f849f4b877fa12bfd4c7103f8d9a74c94c9c4e108")
source_aarch64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("371eadcca97062219cbd8593628eb5d2802bc370515d085fedce1b56b2baed57")
source_i686=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_i686=("9f1f65f624e4c5e41b45be61d1c7e6cd595b77001f66cb9b830ac0e502d2d301")

provides=(rustc libstd-rust-1.80 libstd-rust-dev libstd-rust-dev-windows libstd-rust-dev-wasm32 rust-gdb rust-lldb rust-llvm rust-doc rust-src rust-clippy rustfmt rust-all cargo cargo-doc)
replaces=("${provides[@]}")

maintainer=("xdavius <xdavius@github.com>" "aKqir24 <aKqir24@github.com>")

package() {
  cd "rust-${pkgver}-${AARCH}-unknown-linux-gnu"
  ./install.sh --destdir="${pkgdir}" --prefix=/usr --disable-ldconfig
}
