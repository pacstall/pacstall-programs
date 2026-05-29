pkgname=asdf-vm
pkgver=0.19.0
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
sha256sums_i386=('d7ebfce73b277bed38f8d8d38c056978e5051baf1ea51ae661620f5db4693808')
sha256sums_amd64=('f6aa14de1348c9a85f3095f79792a5cd04305c466e6458c69a36a1621cd729ef')
sha256sums_arm64=('b0543dc68c9616a6a5c42c5b24e250eb5f97c892b628d9178ac87966415663f9')

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
