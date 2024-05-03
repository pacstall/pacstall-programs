pkgname="bpytop-git"
gives="bpytop"
source=("https://github.com/aristocratos/${gives}.git")
pkgver="1.0.68"
makedepends=("make" "python3" "python3-pip" "python3-distutils")
depends=("python3" "python3-pip" "python3-distutils")
pkgdesc="Linux/OSX/FreeBSD resource monitor."
external_connection="true"

prepare() {
  cd "${_archive}"
  modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
  for mod in "${modern[@]}"; do
    [[ ${mod} == "${DISTRO#*:}" ]] && pyhack=("--break-system-packages")
  done
  pip3 install --upgrade psutil "${pyhack[@]}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${gives}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
