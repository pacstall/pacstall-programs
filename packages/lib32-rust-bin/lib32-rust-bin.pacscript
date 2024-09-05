pkgname="lib32-rust-bin"
gives="lib32-rust"
pkgver="1.80.1"
pkgdesc="Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety"
arch=("x86_64" "aarch64")
repology=("project: rust")
url='https://www.rust-lang.org/'
source=("https://static.rust-lang.org/dist/rust-${pkgver}-i686-unknown-linux-gnu.tar.xz")
sha256sums=("9af695dd4eacb397c2169abdfae35c6342f210d04632571d5faf924fa2cc6d39")
provides=(libstd-rust-dev:i386)
replaces=("${provides[@]}")

maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "rust-${pkgver}-i686-unknown-linux-gnu"
  ./install.sh --destdir="${pkgdir}" --prefix=/usr --disable-ldconfig
  rm -fr "${pkgdir:?}"/usr/bin
  rm -fr "${pkgdir:?}"/usr/share
  rm -fr "${pkgdir}"/usr/etc
  rm -fr "${pkgdir}"/usr/libexec
  rm -fr "${pkgdir}"/usr/lib/rustlib/etc
  rm -f "${pkgdir}"/usr/lib/rustlib/* || true
}
