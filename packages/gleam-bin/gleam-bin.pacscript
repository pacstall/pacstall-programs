pkgname="gleam-bin"
pkgver="1.19.2"
pkgdesc="Friendly language for building type-safe systems that scale!"
arch=("amd64" "arm64")
gives="gleam"
url="https://gleam.run"
license=("Apache-2.0")
optdepends=('erlang-dev: Erlang/OTP development libraries and headers.' 'rebar3: Erlang tool to create, develop and release Erlang libraries and applications.')
source=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-${AARCH}-unknown-linux-musl.tar.gz")
sha256sums_amd64=("2ba2afb66ca9f6dcc01a4a6e9169b6942963bad6483bec9571ddc078cfe6f41f")
sha256sums_arm64=("d1d1a9d53f6b317c0563a4806873c8ccace54291ead023373728af379402d4f1")
maintainer=("AJ <ajstrongdev@pm.me>")

package() {
  install -Dm755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
