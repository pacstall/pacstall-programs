pkgname="bpytop-git"
gives="bpytop"
source=("https://github.com/aristocratos/${gives}.git")
pkgver="1.0.68"
makedepends=("make" "python3" "python3-pip" "python3-distutils")
depends=("python3" "python3-pip" "python3-distutils")
pkgdesc="Linux/OSX/FreeBSD resource monitor."
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
  sudo pip3 install --upgrade psutil "${pyhack[@]}"
}

package() {
  cd "${_archive}"
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${gives}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
