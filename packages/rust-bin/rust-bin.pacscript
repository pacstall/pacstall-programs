pkgname="rust-bin"
gives="rust"
pkgver="1.80.1"
pkgdesc="Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety"
arch=("x86_64" "aarch64")
repology=("project: rust")
url='https://www.rust-lang.org/'
source_x86_64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("85e936d5d36970afb80756fa122edcc99bd72a88155f6bdd514f5d27e778e00a")
source_aarch64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("2e89bad7857711a1c11d017ea28fbfeec54076317763901194f8f5decbac1850")
provides=(rustc libstd-rust-1.80 libstd-rust-dev libstd-rust-dev-windows libstd-rust-dev-wasm32 rust-gdb rust-lldb rust-llvm rust-doc rust-src rust-clippy rustfmt rust-all cargo cargo-doc)
replaces=("${provides[@]}")

maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "rust-${pkgver}-${AARCH}-unknown-linux-gnu"
  ./install.sh --destdir="${pkgdir}" --prefix=/usr --disable-ldconfig
}
