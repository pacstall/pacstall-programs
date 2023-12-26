name="exercism-cli"
repology=("project: exercism-cli")
pkgver="3.2.0"
arch=('amd64' 'arm64')
if [[ ${CARCH} == amd64 ]]; then
    hash="4ea3e1ea8916a8003da95dbd6eef7a3a29802e637ed6a0f2aaaa2f1c98754915"
    arch_suffix="x86_64"
else
    hash="57f9620e5346bf045ca72b581cb106f9dc56841ac1ff0a3070188c49d5d0b573"
    arch_suffix="arm64"
fi
url="https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-${arch_suffix}.tar.gz"
pkgdesc=" A Go based command line tool for exercism.org"
homepage='https://exercism.org'
maintainer="Andrew Barchuk <andrew@raindev.io>"

package() {
  sudo install -Dm755 "./exercism" -t "${pkgdir}/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
