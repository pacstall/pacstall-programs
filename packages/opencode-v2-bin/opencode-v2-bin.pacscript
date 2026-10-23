pkgname="opencode-v2-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="2.1.3"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal (V2)"
repology=("project: opencode")
replaces=("opencode-bin")
breaks=("opencode-bin")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("cli-linux-x64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64/-/cli-linux-x64-${pkgver}.tgz")
sha256sums_amd64=("c251bb3962813919d5eb8c0f43cd1cb3ab1d7a0cd28b2e556985706413005cb0")
source_arm64=("cli-linux-arm64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-${pkgver}.tgz")
sha256sums_arm64=("85046ccd46334022a702dc6e53231fefd994ff935a3b934b95390776b36b98c8")

package() {
  install -Dm755 "${srcdir}/package/bin/opencode" "${pkgdir}/usr/bin/opencode"
}
