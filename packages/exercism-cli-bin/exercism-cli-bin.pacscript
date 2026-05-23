pkgname="exercism-cli-bin"
repology=("project: exercism-cli")
pkgver="3.5.8"
arch=('amd64' 'arm64')
sha256sums_amd64=("4ce6a3e5e41e4c51606f8cb94ef6b46e8f45144ef8c613c1ea4b8b69209e02ad")
sha256sums_arm64=("0d2474eba53b14a8e4965c0d3c77b74d037058d2d76c55496deda63c7044d281")
source_amd64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-x86_64.tar.gz")
source_arm64=("https://github.com/exercism/cli/releases/download/v${pkgver}/exercism-${pkgver}-linux-arm64.tar.gz")
pkgdesc="Go based command line tool for exercism.org"
url='https://exercism.org'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  install -Dm755 "./exercism" -t "${pkgdir}/usr/bin"
}

# vim:set ft=sh ts=2 sw=2 et:
