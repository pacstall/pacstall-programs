name="tailscale"
pkgver="1.58.2"
url="https://github.com/tailscale/tailscale/archive/refs/tags/v${pkgver}.tar.gz"
homepage="https://tailscale.com"
depends=('iptables')
makedepends=('golang-go' 'git')
pkgdesc="Private WireGuard networks made easy"
maintainer="Nathan <ndowens@artixlinux.org>"
arch=('amd64')
repology=("project: ${name}")
incompatible=('ubuntu:jammy' 'debian:bookworm')
hash="452f355408e4e2179872387a863387e06346fc8a6f9887821f9b8a072c6a5b0a"

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
