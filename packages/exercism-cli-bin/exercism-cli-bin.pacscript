pkgname="exercism-cli-bin"
repology=("project: exercism-cli")
pkgver="3.4.0"
arch=('amd64' 'arm64')
sha256sums_amd64=("492b536d7e9ff909beb0e3f866af1b0ace48e5ae76235200c2add67db19a2cf3")
sha256sums_arm64=("648c9e87dae3168e633cd57091c559620951ac7ee9decd250b701839d62237b7")
source_amd64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-x86_64.tar.gz")
source_arm64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-arm64.tar.gz")
pkgdesc="Go based command line tool for exercism.org"
url='https://exercism.org'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  install -Dm755 "./exercism" -t "${pkgdir}/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
