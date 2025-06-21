pkgname="forticlient-deb"
gives="forticlient"
pkgver="7.4.3.1736"
source=("https://filestore.fortinet.com/forticlient/downloads/forticlient_vpn_${pkgver}_amd64.deb")
breaks=("${gives}" "${gives}-git" "${gives}-bin" "${gives}-app" "${gives}-deb")
pkgdesc="The VPN-only version of FortiClient offers SSL VPN and IPSecVPN, but does not include any support."
sha256sums=("45c465ca669d4bc6d0f1d3a93f4eb765b996e05c10f6e8e9e2db2fa6728a541c")
arch=('amd64')
