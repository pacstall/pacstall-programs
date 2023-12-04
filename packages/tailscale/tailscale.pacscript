name="tailscale"
pkgver="1.54.1"
url="https://github.com/tailscale/tailscale/archive/refs/tags/v${pkgver}.tar.gz"
homepage="https://tailscale.com"
depends=('iptables')
makedepends=('golang-go' 'git')
pkgdesc="Private WireGuard networks made easy"
maintainer="Nathan <ndowens@artixlinux.org>"
arch=('amd64')
repology=("project: ${name}")
incompatible=('ubuntu:jammy' 'debian:bookworm')
hash="56ef2e53fd42373b90a9ec5e057f61c2bb4455551dc13b74f49fbdd6b393ecdb"

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
