pkgname="opencode-v2-bin"
arch=("amd64" "arm64")
gives="opencode"
pkgver="2.2.1"
url='https://github.com/anomalyco/opencode'
pkgdesc="AI coding agent built for the terminal (V2)"
repology=("project: opencode")
replaces=("opencode-bin")
breaks=("opencode-bin")
depends=("ripgrep")
license=('MIT')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("cli-linux-x64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64/-/cli-linux-x64-${pkgver}.tgz")
sha256sums_amd64=("42cf1dddf7d1abadcee895ac9c66489ec994b8c650b1f4aec9d3b3e7d07d9a5e")
source_arm64=("cli-linux-arm64-${pkgver}.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-${pkgver}.tgz")
sha256sums_arm64=("2cee12677c310dd173f99e96952612cf6cd2031977d3762e3aeaa6767fd7b20b")

package() {
  install -Dm755 "${srcdir}/package/bin/opencode" "${pkgdir}/usr/bin/opencode"
}
