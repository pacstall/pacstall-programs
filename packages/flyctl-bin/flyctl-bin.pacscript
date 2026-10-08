pkgname="flyctl-bin"
repology=("project: flyctl")
pkgver="0.4.60"
arch=("amd64" "arm64")
sha256sums_amd64=("1be9f4e31e8002a85f96923d72ea7776c0af5aa0cb0a36e1f16b135a83db4c81")
sha256sums_arm64=("66b516ed75f44e685db8e44eb3feffbe939f7e63da6727693670eb37a46a09a7")
source_amd64=("https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_arm64.tar.gz")
pkgdesc="Command line tool for fly.io services"
url='https://fly.io'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  install -Dm755 flyctl "${pkgdir}/usr/bin/fly"
}

# vim:set ft=sh ts=2 sw=2 et:
