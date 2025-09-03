pkgname="flyctl-bin"
repology=("project: flyctl")
pkgver="0.3.144"
arch=("amd64" "arm64")
sha256sums_amd64=("8b81469299c1e53c129f469501b341a402b21f1781f5dc25338d4a3910ebad96")
sha256sums_arm64=("bea8261d481e815fa725e737af37a3d0f3c13c8227f00780e0f53a4af87ef156")
source_amd64=("https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_arm64.tar.gz")
pkgdesc="Command line tool for fly.io services"
url='https://fly.io'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  install -Dm755 "./flyctl" -t "${pkgdir}/usr/bin"
  ln -sf /usr/bin/flyctl "${pkdir}/usr/bin/fly"
}

# vim:set ft=sh ts=2 sw=2 et:
