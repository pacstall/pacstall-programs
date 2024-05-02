pkgname="qtile-extras-git"
gives="qtile-extras"
source=("https://github.com/elParaguayo/${gives}.git")
pkgver="0.23.1"
pkgdesc="A list of mods developed by elParaguayo for Qtile"
pacdeps=("qtile-git")
maintainer=("Ruturajn <nanotiruturaj@gmail.com>")
makedepends=("python3-venv" "python3-pip")

release="$(lsb_release -cs)"
modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
# shellcheck disable=SC2076
if [[ " ${modern[*]} " =~ " ${release} " ]]; then
  pyhack=("--break-system-packages")
else
  pyhack=()
fi

build() {
  cd "${_archive}"
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
