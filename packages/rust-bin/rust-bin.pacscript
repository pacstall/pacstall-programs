pkgname="rust-bin"
gives="rust"
pkgver="1.87.0"
pkgdesc="Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety"
arch=("x86_64" "aarch64" "i686")
repology=("project: rust")
url='https://www.rust-lang.org/'
source_x86_64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("9720bf4ffdd5e6112f8fc93a645d50bfdc64f95cb76d41561be196e1721b4b69")
source_aarch64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("0bd04d32129f03465c1d2cae66f99d8c1c6d33c070b0e19b80a66b2b31ae6b9e")
source_i686=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_i686=("864cff3b67eab598f8e035587ebb39e547cbc5b5ee8e5f2eb35e5a6325ae57f9")

provides=(rustc libstd-rust-1.80 libstd-rust-dev libstd-rust-dev-windows libstd-rust-dev-wasm32 rust-gdb rust-lldb rust-llvm rust-doc rust-src rust-clippy rustfmt rust-all cargo cargo-doc)
replaces=("${provides[@]}")

maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "rust-${pkgver}-${AARCH}-unknown-linux-gnu"
  ./install.sh --destdir="${pkgdir}" --prefix=/usr --disable-ldconfig
}
