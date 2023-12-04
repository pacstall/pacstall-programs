name="qtile-git"
gives="qtile"
url="https://github.com/qtile/qtile.git"
pkgver="0.22.1"
license="MIT"
depends=("python3-cffi" "xserver-xorg" "python3-xcffib" "python3-cairocffi" "libpangocairo-1.0-0" "python3-pip" "python3-dbus" "libpulse-dev" "pavucontrol" "python3-testresources")
pkgdesc="A full-featured, hackable tiling window manager written and configured in Python"
maintainer="Ruturajn <nanotiruturaj@gmail.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

release="$(lsb_release -cs)"
modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
# shellcheck disable=SC2076
if [[ " ${modern[*]} " =~ " ${release} " ]]; then
  pyhack=("--break-system-packages")
else
  pyhack=()
fi

package() {
  sudo pip3 install --upgrade --no-cache --force-reinstall cairocffi cffi xcffib "${pyhack[@]}"
  sudo pip3 install dbus-next setuptools-scm setuptools "${pyhack[@]}"
  sudo mkdir -p "${pkgdir}"/usr/share/xsessions
  sudo chown root:root ./
  sudo python3 setup.py install --root="${pkgdir}"
  sudo cp ./resources/qtile.desktop "${pkgdir}"/usr/share/xsessions/qtile.desktop
}

post_remove() {
  sudo pip3 uninstall dbus-next setuptools-scm setuptools "${pyhack[@]}"
}
