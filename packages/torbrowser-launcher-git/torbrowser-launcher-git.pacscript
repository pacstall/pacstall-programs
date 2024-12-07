pkgname="torbrowser-launcher-git"
gives="torbrowser-launcher"
breaks=("${gives}")
repology=("project: ${gives}")
source=("https://github.com/micahflee/torbrowser-launcher.git")
arch=("any")
pkgver="0.3.6"
makedepends=("build-essential")
depends=("gettext" "python3-pip" "dh-python" "python3-all" "python3-pyqt5" "python3-gpg" "python3-requests" "python3-socks" "python3-packaging" "gnupg2" "tor")
pkgdesc="Securely and easily download, verify, install, and launch Tor Browser in Linux"
optdepends=("apparmor: support for apparmor profiles")
maintainer=("Oren Klopfer <oren@taumoda.com>")
external_connection="true"

prepare() {
  cd "torbrowser-launcher"
  modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
  for mod in "${modern[@]}"; do
    [[ ${mod} == "${DISTRO#*:}" ]] && pyhack=("--break-system-packages")
  done
  pip3 install distro "${pyhack[@]}"
}

build() {
  cd "torbrowser-launcher"
  python3 setup.py build
}

package() {
  cd "torbrowser-launcher"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
