pkgname="gleam-bin"
pkgver="1.19.0"
pkgdesc="Friendly language for building type-safe systems that scale!"
arch=("amd64" "arm64")
gives="gleam"
url="https://gleam.run"
license=("Apache-2.0")
optdepends=('erlang-dev: Erlang/OTP development libraries and headers.' 'rebar3: Erlang tool to create, develop and release Erlang libraries and applications.')
source=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-${AARCH}-unknown-linux-musl.tar.gz")
sha256sums_amd64=("6083148cb404460810afe35e7878527e58fd2512dd79a76b47d59723815753be")
sha256sums_arm64=("b7677e3763eb7a6752e37f9a7f6f9451419cab5ccdbf4a41814a81356c58cc1d")
maintainer=("AJ <ajstrongdev@pm.me>")

package() {
  install -Dm755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
