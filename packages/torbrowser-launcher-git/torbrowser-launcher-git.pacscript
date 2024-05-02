pkgname="torbrowser-launcher-git"
gives="torbrowser-launcher"
breaks=("${gives}")
repology=("project: ${gives}")
source=("https://github.com/micahflee/torbrowser-launcher.git")
pkgver="0.3.6"
makedepends=("build-essential")
depends=("gettext" "python3-pip" "dh-python" "python3-all" "python3-pyqt5" "python3-gpg" "python3-requests" "python3-socks" "python3-packaging" "gnupg2" "tor")
pkgdesc="Securely and easily download, verify, install, and launch Tor Browser in Linux"
optdepends=("apparmor: support for apparmor profiles")
maintainer=("Oren Klopfer <oren@taumoda.com>")

release="$(lsb_release -cs)"
modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
# shellcheck disable=SC2076
if [[ " ${modern[*]} " =~ " ${release} " ]]; then
  pyhack=("--break-system-packages")
else
  pyhack=()
fi

prepare() {
  cd "${_archive}"
  pip3 install distro "${pyhack[@]}"
}

build() {
  cd "${_archive}"
  python3 setup.py build
}

package() {
  cd "${_archive}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
