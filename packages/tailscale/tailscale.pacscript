name="tailscale"
pkgver="1.56.0"
url="https://github.com/tailscale/tailscale/archive/refs/tags/v${pkgver}.tar.gz"
homepage="https://tailscale.com"
depends=('iptables')
makedepends=('golang-go' 'git')
pkgdesc="Private WireGuard networks made easy"
maintainer="Nathan <ndowens@artixlinux.org>"
arch=('amd64')
repology=("project: ${name}")
incompatible=('ubuntu:jammy' 'debian:bookworm')

hash="0ae6a4405fb950083d5cec6798ac65cd1dbb06a8aa4135d418278260dc3aa6d0"


prepare() {
  go mod vendor
  sed -i 's,/usr/sbin,/usr/bin/,g' cmd/tailscaled/tailscaled.service
}

build() {
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
  sudo install -Dm755 tailscale tailscaled -t "${pkgdir}/usr/bin"
  sudo install -Dm644 cmd/tailscaled/tailscaled.defaults "${pkgdir}/etc/default/tailscaled"
  sudo install -Dm644 cmd/tailscaled/tailscaled.service -t "${pkgdir}/usr/lib/systemd/system"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
