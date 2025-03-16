pkgname=asdf-vm
pkgver=0.16.4
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
sha256sums_i386=('71c6a3147a87145dbda6d07de6ef61c25d6e135ab04b8c1f88efe2185465fff6')
sha256sums_amd64=('8db60d26924979649070f74b458c9771fe840410612f87cacf2373db50ddc65d')
sha256sums_arm64=('0bf0507dfb4b27c59d1afa1564238b2083a694ae45070b40ea4a3a80b9f05279')

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
