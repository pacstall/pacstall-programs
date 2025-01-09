pkgname="rust-bin"
gives="rust"
pkgver="1.83.0"
pkgdesc="Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety"
arch=("x86_64" "aarch64" "i686")
repology=("project: rust")
url='https://www.rust-lang.org/'
source_x86_64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("b6467a0e8a6c5dca35269785c994e4d80d89754d6c600162cc9146f90c87ee08")
source_aarch64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("5f02e00bca65f6eebafe2ac6b1bbdecb5f160f260a9c2231a51ed8d382f0ada0")
source_i686=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_i686=("e36915f3a68d8da7166b49ad67d23d26efc79f38cf6a3db102dc022eb2ed1b0a")

provides=(rustc libstd-rust-1.80 libstd-rust-dev libstd-rust-dev-windows libstd-rust-dev-wasm32 rust-gdb rust-lldb rust-llvm rust-doc rust-src rust-clippy rustfmt rust-all cargo cargo-doc)
replaces=("${provides[@]}")

maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "rust-${pkgver}-${AARCH}-unknown-linux-gnu"
  ./install.sh --destdir="${pkgdir}" --prefix=/usr --disable-ldconfig
}
