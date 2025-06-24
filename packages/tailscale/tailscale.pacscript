pkgname="tailscale"
pkgver="1.84.2"
source=("@${pkgname}~${pkgver}::https://github.com/tailscale/tailscale/archive/refs/tags/v${pkgver}.tar.gz")
url='https://tailscale.com'
depends=('iptables')
makedepends=('golang-go' 'git')
pkgdesc="Private WireGuard networks made easy"
maintainer=("Nathan <ndowens@artixlinux.org>")
arch=('amd64')
repology=("project: ${pkgname}")
incompatible=('ubuntu:jammy' 'debian:bookworm')
sha256sums=("32673e5552e1176f1028a6a90a4c892d2475c92d1e952ca16156dc523d14d914")
external_connection=true

prepare() {
  cd "${pkgname}~${pkgver}"
  go mod vendor
  sed -i 's,/usr/sbin,/usr/bin/,g' cmd/tailscaled/tailscaled.service
}

build() {
  cd "${pkgname}~${pkgver}"
  export GO111MODULE=on
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  _GO_LDFLAGS="-compressdwarf=false \
  	-linkmode=external \
	-X tailscale.com/version.longStamp=${pkgver} \
	-X tailscale.com/version.shortStamp=$(cut -d+ -f1 <<< "${pkgver}")"
  for cmd in ./cmd/tailscale ./cmd/tailscaled; do
    go build -v -tags xversion -ldflags "${_GO_LDFLAGS}" "${cmd}"
  done
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 tailscale tailscaled -t "${pkgdir}/usr/bin"
  install -Dm644 cmd/tailscaled/tailscaled.defaults "${pkgdir}/etc/default/tailscaled"
  install -Dm644 cmd/tailscaled/tailscaled.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
}
