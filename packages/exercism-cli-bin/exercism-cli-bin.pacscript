pkgname="exercism-cli-bin"
repology=("project: exercism-cli")
pkgver="3.5.5"
arch=('amd64' 'arm64')
sha256sums_amd64=("053be98b0be16a7ce647d1173ec55ec6c67b132829c660cfe41ca6960586fb9a")
sha256sums_arm64=("c096893fa9f38e0b0cf54b152a965ccfdc72d428d70d385b6da9a7b7e95a70dc")
source_amd64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-x86_64.tar.gz")
source_arm64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-arm64.tar.gz")
pkgdesc="Go based command line tool for exercism.org"
url='https://exercism.org'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  install -Dm755 "./exercism" -t "${pkgdir}/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
