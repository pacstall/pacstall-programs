pkgname="rust-bin"
gives="rust"
pkgver="1.92.0"
pkgdesc="Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety"
arch=("x86_64" "aarch64" "i686")
repology=("project: rust")
url='https://www.rust-lang.org/'
source_x86_64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("d2ccef59dd9f7439f2c694948069f789a044dc1addcc0803613232af8f88ee0c")
source_aarch64=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("3e383f8b4fca710d0600d0c1de97b78281672be2cda6575ecbe1c183a12e3822")
source_i686=("https://static.rust-lang.org/dist/rust-${pkgver}-${AARCH}-unknown-linux-gnu.tar.xz")
sha256sums_i686=("bdccb6bf0eb08b256ec08115e6b7a7daeb5db097b2f75288f1935ee3177f2cf1")

provides=(rustc libstd-rust-1.80 libstd-rust-dev libstd-rust-dev-windows libstd-rust-dev-wasm32 rust-gdb rust-lldb rust-llvm rust-doc rust-src rust-clippy rustfmt rust-all cargo cargo-doc)
replaces=("${provides[@]}")

maintainer=("xdavius <xdavius@github.com>" "aKqir24 <aKqir24@github.com>")

package() {
  cd "rust-${pkgver}-${AARCH}-unknown-linux-gnu"
  ./install.sh --destdir="${pkgdir}" --prefix=/usr --disable-ldconfig
}
