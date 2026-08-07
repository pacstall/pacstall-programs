pkgname="matugen-git"
gives="matugen"
repology=("project: matugen")
arch=("any")
pkgver="4.1.0"
license=("GPL-2.0")
url='https://github.com/InioX/matugen'
pkgdesc='Material you color generation tool with templates'
source=("${gives}"::"git+$https://github.com/InioX/${gives}.git")
replaces=("i3status-rust" "i3status-rs")
pacdeps=("rust-bin")
makedepends=("git")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

prepare() {
  cd "${gives}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${gives}"
  cargo build -j"${NCPU}" --release --frozen
}

package() {
  cd "${gives}"
  install -Dm755 "target/release/${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
