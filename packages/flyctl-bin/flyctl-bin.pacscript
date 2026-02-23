pkgname="flyctl-bin"
repology=("project: flyctl")
pkgver="0.4.14"
arch=("amd64" "arm64")
sha256sums_amd64=("3bfdce07d87f8618d3352b30affed368bcfe2da7e77333e3b8198998bb87e713")
sha256sums_arm64=("f70a3087ecc9526220f92777f6f24f28d6a7f969a64dd81e2300c3f59e6bf39d")
source_amd64=("https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_arm64.tar.gz")
pkgdesc="Command line tool for fly.io services"
url='https://fly.io'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  install -Dm755 flyctl "${pkgdir}/usr/bin/fly"
}

# vim:set ft=sh ts=2 sw=2 et:
