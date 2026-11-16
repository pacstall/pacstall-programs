pkgname="opencode-v2-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="2.3.0"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal (V2)"
repology=("project: opencode")
replaces=("opencode-bin")
breaks=("opencode-bin")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("cli-linux-x64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64/-/cli-linux-x64-${pkgver}.tgz")
sha256sums_amd64=("408f854b5fac7857a3b4df4e783d3a8b70f5cc8c7c3187aac09c5be0576c14ae")
source_arm64=("cli-linux-arm64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-${pkgver}.tgz")
sha256sums_arm64=("be30066353bb592c43919b31072ff4099e069636c31a16806b088737e0287cea")

package() {
  install -Dm755 "${srcdir}/package/bin/opencode" "${pkgdir}/usr/bin/opencode"
}
