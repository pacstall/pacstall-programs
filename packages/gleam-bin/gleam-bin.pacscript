pkgname="gleam-bin"
pkgver="1.19.1"
pkgdesc="Friendly language for building type-safe systems that scale!"
arch=("amd64" "arm64")
gives="gleam"
url="https://gleam.run"
license=("Apache-2.0")
optdepends=('erlang-dev: Erlang/OTP development libraries and headers.' 'rebar3: Erlang tool to create, develop and release Erlang libraries and applications.')
source=("https://github.com/gleam-lang/gleam/releases/download/v${pkgver}/gleam-v${pkgver}-${AARCH}-unknown-linux-musl.tar.gz")
sha256sums_amd64=("221bff0758372aae76cfe440b7445f9f5c7ea67947297b1112115c798fd18385")
sha256sums_arm64=("b0eeed8c625471c2ab0fab7058b53979c47fa3bd84315b49b69481e26d583f7d")
maintainer=("AJ <ajstrongdev@pm.me>")

package() {
  install -Dm755 "${srcdir}/gleam" "${pkgdir}/usr/bin/gleam"
}
