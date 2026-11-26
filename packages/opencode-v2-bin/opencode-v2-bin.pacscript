pkgname="opencode-v2-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="2.4.2"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal (V2)"
repology=("project: opencode")
replaces=("opencode-bin")
breaks=("opencode-bin")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("cli-linux-x64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64/-/cli-linux-x64-${pkgver}.tgz")
sha256sums_amd64=("99d288cb5c68411622cbd5a5629afb8f07110cd0a748d7cdd7eb34b08cf56f5a")
source_arm64=("cli-linux-arm64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-${pkgver}.tgz")
sha256sums_arm64=("d0847f587adca7339c69e22631c50edd6e4f97dee99cec8596e1ec810b98ae95")

package() {
  install -Dm755 "${srcdir}/package/bin/opencode" "${pkgdir}/usr/bin/opencode"
}
