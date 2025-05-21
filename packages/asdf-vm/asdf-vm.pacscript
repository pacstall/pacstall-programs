pkgname=asdf-vm
pkgver=0.17.0
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
sha256sums_i386=('255f3e6157c1cb5019222a83839f708cc1d31ddf1977516c0ba4af13393e4b2e')
sha256sums_amd64=('b62f919da57c6c8e5372fdd718b9a59c41dab9ca53cd759aa9522ca499d9ef98')
sha256sums_arm64=('a6f0ac667caef652eeb574f77f9b010b1790bcaff0262e40c75ec90d66decb97')

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
