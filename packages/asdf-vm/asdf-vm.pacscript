pkgname=asdf-vm
pkgver=0.16.0
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more'
repology=("project: ${pkgname}")
arch=('i386' 'amd64' 'arm64')
url='https://asdf-vm.com'
license=('MIT')
depends=(
  'curl'
  'git'
)
optdepends=(
  'build-essential: Array of tools to build software'
  'bash-completion: For completions to work in Bash'
  'libncurses5-dev: Text-based UI library for terminal applications'
  'libncurses-dev: Text-based UI library for terminal applications'
  'unzip: Needed by some plugins, like Elixir'
)
source_i386="${pkgname}-${pkgver}-i386.tar.gz::https://github.com/asdf-vm/asdf/releases/download/v${pkgver}/asdf-v${pkgver}-linux-386.tar.gz"
source_amd64="${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/asdf-vm/asdf/releases/download/v${pkgver}/asdf-v${pkgver}-linux-amd64.tar.gz"
source_arm64="${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/asdf-vm/asdf/releases/download/v${pkgver}/asdf-v${pkgver}-linux-arm64.tar.gz"
sha256sums_i386=('f3ee5eb3089304fe5d3961174b045feaf2bf33afd6b232a10237dd5d607a7e03')
sha256sums_amd64=('7558f8b916fa461ea04b653fdb62fea01362720349e9ef3aa497bc7ef93d22ac')
sha256sums_arm64=('5394e85001a36dc792087069303fa66e08d0f67740448fcd68dded974aaadb77')

package() {
  install -Dm755 "asdf" "${pkgdir}/usr/bin/asdf"
}

post_install() {
  cat << EOF

asdf-vm ${pkgver} installed!

NOTICE!:
Version 0.16.0 brought breaking changes.
Please see the official instructions for more information [0].
Don't forget to run 'asdf reshim' after you're done to adjust your shims to
the new version.


[0] https://asdf-vm.com/guide/upgrading-to-v0-16.html#breaking-changes

EOF
}
