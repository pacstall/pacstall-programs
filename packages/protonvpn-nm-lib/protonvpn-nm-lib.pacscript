name="protonvpn-nm-lib"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="3.8.0"
url="https://github.com/ProtonVPN/${name}/archive/refs/tags/${version}.tar.gz"
depends="python3 python3-setuptools network-manager network-manager-openvpn openvpn python3-xdg python3-keyring python3-jinja2 python3-distro gir1.2-nm-1.0 libsecret-tools dbus-x11 gnome-keyring network-manager-openvpn-gnome"
description="The ProtonVPN NM (NetworkManager) Library is intended for every ProtonVPN service user"
hash="c8193defd5722a460b4628c54fbc55556caa525e70476a7e15fccf06f155cd97"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}

# Just testing
