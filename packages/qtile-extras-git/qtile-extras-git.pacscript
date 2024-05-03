pkgname="qtile-extras-git"
gives="qtile-extras"
source=("https://github.com/elParaguayo/${gives}.git")
pkgver="0.23.1"
pkgdesc="A list of mods developed by elParaguayo for Qtile"
pacdeps=("qtile-git")
maintainer=("Ruturajn <nanotiruturaj@gmail.com>")
makedepends=("python3-venv" "python3-pip")

build() {
  cd "${_archive}"
  modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
  for mod in "${modern[@]}"; do
    [[ ${mod} == "${DISTRO#*:}" ]] && pyhack=("--break-system-packages")
  done
  pip3 install build --user "${pyhack[@]}"
  python3 -m build
  mv dist/*.whl .
}

package() {
  cd "${_archive}"
  pip3 install qtile_extras*.whl "${pyhack[@]}"
}


post_remove() {
  sudo pip3 uninstall "${gives}" "${pyhack[@]}" -y
}
