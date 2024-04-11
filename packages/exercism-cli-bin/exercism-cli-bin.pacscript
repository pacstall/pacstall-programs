pkgname="exercism-cli-bin"
repology=("project: exercism-cli")
pkgver="3.2.0"
arch=('amd64' 'arm64')
sha256sums_amd64=("4ea3e1ea8916a8003da95dbd6eef7a3a29802e637ed6a0f2aaaa2f1c98754915")
sha256sums_arm64=("57f9620e5346bf045ca72b581cb106f9dc56841ac1ff0a3070188c49d5d0b573")
if [[ ${CARCH} == amd64 ]]; then
    arch_suffix="x86_64"
else
    arch_suffix="arm64"
fi
source=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-${arch_suffix}.tar.gz")
pkgdesc="Go based command line tool for exercism.org"
homepage='https://exercism.org'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  cd "${_archive}"
  install -Dm755 "./exercism" -t "${pkgdir}/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
