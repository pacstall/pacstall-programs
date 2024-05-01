pkgname="forticlient-deb"
gives="forticlient"
pkgver="7.0.0.0018"
source=("https://filestore.fortinet.com/forticlient/downloads/forticlient_vpn_${pkgver}_amd64.deb")
breaks=("${gives}" "${gives}-git" "${gives}-bin" "${gives}-app" "${gives}-deb")
pkgdesc="The VPN-only version of FortiClient offers SSL VPN and IPSecVPN, but does not include any support."
sha256sums=("82e5817048a60ff95d2e88b4a95512f9f0035fa37240ce57580c203b5a8a79c9")
arch=('amd64')
