name="libtomlplusplus-header"
pkgver="3.4.0"
pkgdesc="Header-only TOML config file parser and serializer for C++17"
homepage='https://marzer.github.io/tomlplusplus/'
url="https://raw.githubusercontent.com/marzer/tomlplusplus/v${pkgver}/toml.hpp"
hash="6b5172ad4dd6519aec67b919181fa7a38a2234131e5b2afa232dfe444819783e"
repology=("project: tomlplusplus")
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm644 "toml.hpp" -t "${pkgdir}/usr/local/include/toml++/"
}
