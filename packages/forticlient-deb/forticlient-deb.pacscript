name="forticlient-deb"
pkgname="forticlient"
pkgver="7.0.0.0018"
source=("https://filestore.fortinet.com/forticlient/downloads/forticlient_vpn_${pkgver}_amd64.deb")
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-bin" "${pkgname}-app" "${pkgname}-deb")
pkgdesc="The VPN-only version of FortiClient offers SSL VPN and IPSecVPN, but does not include any support."
hash=("82e5817048a60ff95d2e88b4a95512f9f0035fa37240ce57580c203b5a8a79c9")
arch=('amd64')
