pkgname="gleam-bin"
pkgver="1.18.1"
pkgdesc="Friendly language for building type-safe systems that scale!"
arch=("amd64" "arm64")
gives="gleam"
url="https://gleam.run"
license=("Apache-2.0")
optdepends=('erlang-dev: Erlang/OTP development libraries and headers.' 'rebar3: Erlang tool to create, develop and release Erlang libraries and applications.')
source=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-${AARCH}-unknown-linux-musl.tar.gz")
sha256sums_amd64=("4955a38c2e8c99457458e2471472ccd5ee3c45bd7637a315ce33bccf0dd75d9e")
sha256sums_arm64=("ea08a64846677f36da7f2e9163c4393dd9a9dee814d13a8fb28fbe7dcbf32f6d")
maintainer=("AJ <ajstrongdev@pm.me>")

package() {
  install -Dm755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
