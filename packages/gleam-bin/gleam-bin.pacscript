pkgname="gleam-bin"
pkgver="1.18.1"
pkgdesc="Friendly language for building type-safe systems that scale!"
arch=("amd64" "arm64")
gives="gleam"
url="https://gleam.run"
license=("Apache-2.0")
optdepends=('erlang-dev: Erlang/OTP development libraries and headers.' 'rebar3: Erlang tool to create, develop and release Erlang libraries and applications.')
source_amd64=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_amd64=("4955a38c2e8c99457458e2471472ccd5ee3c45bd7637a315ce33bccf0dd75d9e")
source_arm64=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_arm64=("ea08a64846677f36da7f2e9163c4393dd9a9dee814d13a8fb28fbe7dcbf32f6d")

package() {
  install -Dm755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
