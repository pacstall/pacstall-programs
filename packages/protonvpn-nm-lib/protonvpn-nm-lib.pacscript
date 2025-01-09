pkgname="protonvpn-nm-lib"
breaks="${pkgname}-git"
replaces=("${pkgname}")
repology=("project: ${pkgname}")
arch=("any")
pkgver="3.8.0"
source=("@${pkgname}~${pkgver}::https://github.com/ProtonVPN/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
depends=("python3" "network-manager" "network-manager-openvpn" "openvpn" "gir1.2-nm-1.0" "libsecret-tools" "dbus-x11" "gnome-keyring" "network-manager-openvpn-gnome")
makedepends=("python3-setuptools" "python3-xdg" "python3-xdg" "python3-distro" "python3-keyring")
pkgdesc="The ProtonVPN NM (NetworkManager) Library is intended for every ProtonVPN service user"
sha256sums=("c8193defd5722a460b4628c54fbc55556caa525e70476a7e15fccf06f155cd97")

package() {
  cd "${pkgname}~${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
