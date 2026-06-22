pkgname="gitui-git"
gives="gitui"
pkgdesc="Blazing fast terminal-ui for git written in Rust"
url='https://github.com/extrawurst/gitui'
source=("https://github.com/extrawurst/gitui.git")
maintainer=("pythoncrazy <pinakpaliwal07@gmail.com>")
arch=("any")
pkgver="0.26.3"
depends=('gcc' 'libgit2-dev' 'libxcb1' 'zlib1g-dev')
makedepends=('git' 'cargo' 'python3' 'cmake')
incompatible=('debian:bookworm')
external_connection="true"

prepare() {
  cd "${gives}"
  cargo fetch --locked --target "${AARCH}-unknown-linux-gnu"
}

build() {
  cd "${gives}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBGIT2_SYS_USE_PKG_CONFIG=1
  cargo build --release
}

check() {
  cd "${gives}"
  export RUSTUP_TOOLCHAIN=stable
  export LIBGIT2_SYS_USE_PKG_CONFIG=1
  cargo test --release
}

package() {
  cd "${gives}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" {KEY_CONFIG,README,THEMES}.md
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
}
