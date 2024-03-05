name="exercism-cli-bin"
repology=("project: exercism-cli")
pkgver="3.2.0"
arch=('amd64' 'arm64')
source_amd64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-x86_64.tar.gz")
source_arm64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-arm64.tar.gz")
hash_amd64=("4ea3e1ea8916a8003da95dbd6eef7a3a29802e637ed6a0f2aaaa2f1c98754915")
hash_arm64=("57f9620e5346bf045ca72b581cb106f9dc56841ac1ff0a3070188c49d5d0b573")
pkgdesc="Go based command line tool for exercism.org"
homepage='https://exercism.org'
maintainer="Andrew Barchuk <andrew@raindev.io>"

package() {
  sudo install -Dm755 "./exercism" -t "${pkgdir}/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
