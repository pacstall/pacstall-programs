pkgname="bun-bin"
gives="bun"
pkgver="1.4.5"
arch=("amd64" "arm64")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
pkgdesc="Incredibly fast JavaScript and TypeScript runtime, bundler, test runner, and package manager"
url='https://bun.sh'
license=("MIT")
repology=("project: bun")
breaks=("${gives}")
replaces=("${gives}")
depends=("unzip")
source_amd64=("https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha256sums_amd64=("94559b3b528995a49452f9f2404cec74f2efd7d06e0a000a8cd214b02c3666eb")
source_arm64=("https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums_arm64=("18656a3bf0ea5641f5796ae4213b75255579a70a0fded2f337933785568cdf84")

package() {
  install -Dm755 "${srcdir}"/bun-linux-*/bun "${pkgdir}/usr/bin/bun"
  ln -sf "/usr/bin/bun" "${pkgdir}/usr/bin/bunx"
}
