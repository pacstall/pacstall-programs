name="qtile-extras-git"
gives="qtile-extras"
url="https://github.com/elParaguayo/${gives}.git"
pkgver="0.23.1"
pkgdesc="A list of mods developed by elParaguayo for Qtile"
pacdeps=("qtile-git")
maintainer="Ruturajn <nanotiruturaj@gmail.com>"
makedepends=("python3-venv" "python3-pip")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

release="$(lsb_release -cs)"
modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
# shellcheck disable=SC2076
if [[ " ${modern[*]} " =~ " ${release} " ]]; then
  pyhack=("--break-system-packages")
else
  pyhack=()
fi

build() {
  pip3 install build --user "${pyhack[@]}"
  python3 -m build
  sudo mv dist/*.whl .
}

package() {
  sudo pip3 install qtile_extras*.whl "${pyhack[@]}"
}


post_remove() {
  sudo pip3 uninstall "${gives}" "${pyhack[@]}"
}
