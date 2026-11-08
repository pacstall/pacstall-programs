pkgname="opencode-v2-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="2.2.6"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal (V2)"
repology=("project: opencode")
replaces=("opencode-bin")
breaks=("opencode-bin")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("cli-linux-x64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64/-/cli-linux-x64-${pkgver}.tgz")
sha256sums_amd64=("dfcd69f1d511ae10ed626768b41d84b8100cc4aa64cecb69da38ba7a29d33551")
source_arm64=("cli-linux-arm64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-${pkgver}.tgz")
sha256sums_arm64=("22352e200630ec61a48a65b9f5c2b627328ae5002658d81c067f67c5fb689898")

package() {
  install -Dm755 "${srcdir}/package/bin/opencode" "${pkgdir}/usr/bin/opencode"
}
