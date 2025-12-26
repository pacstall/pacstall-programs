_pkgname="lenovolegionlinux"
pkgname="${_pkgname}-git"
pkgver="1.c1e9b55"
pkgdesc="LenovoLegionLinux (LLL) brings additional drivers and tools for Lenovo Legion series laptops to Linux"
arch=("amd64")
url='https://github.com/johnfanv2/LenovoLegionLinux'
maintainer=("MrDuartePT <gonegrier.duarte@gmail.com>")
license=('GPL-2.0-only')
depends=(
  python3
  python3-argcomplete
  python3-yaml
  python3-pyqt6
  polkitd
)
pacdeps=(python3-darkdetect)
makedepends=(
  git
  python3-build
  python3-installer
  python3-setuptools
  python3-wheel
  libinih-dev
)
#optdepends=("lenovolegionlinux-dkms-git: DKMS module") # needs to be fix
replaces=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/johnfanv2/LenovoLegionLinux"
  "https://raw.githubusercontent.com/benhoyt/inih/refs/tags/r58/ini.c"
)
sha256sums=(
  'SKIP'
  '217fa78f0380669c91a565f3e414d0a8be0f7a7fdfd1e3839f213e86aa574a95'
)

prepare() {
  cd "${_pkgname}"
  sed -i "s/version = _VERSION/version = 1.0.0/g" "${srcdir}/${_pkgname}/python/legion_linux/setup.cfg"
  sed -i "s/SRC = \$(wildcard modules\/\*.c)/SRC = \$(wildcard ini.c modules\/\*.c)/g" "./extra/service/legiond/Makefile"
  cp "${srcdir}/ini.c" "${srcdir}/${_pkgname}/extra/service/legiond"
}

build() {
  cd "${srcdir}/${_pkgname}/python/legion_linux"
  python3 -m build --wheel --no-isolation

  # Compile legiond daemon
  cd legion_linux/extra/service/legiond
  make -j"${NCPU}"
}

package() {
  mkdir -p "${pkgdir}/etc/systemd/system"

  cd "${srcdir}/${_pkgname}/python/legion_linux"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl

  # Systemd service
  cd "${srcdir}/${_pkgname}/extra"
  install -Dm664 service/*.service -t "${pkgdir}/etc/systemd/system"
  install -Dm664 service/*.timer -t "${pkgdir}/etc/systemd/system"

  # legiond daemon
  install -Dm775 service/legiond/legiond -t "${pkgdir}/usr/bin"
  install -Dm775 service/legiond/legiond-ctl -t "${pkgdir}/usr/bin"
}

post_install() {
  echo "Default config files are present in /usr/share/legion_linux"
  echo "Frist install: Pls copy folder /usr/share/legion_linux to /etc/legion_linux"
  echo "Is also provided acpi exemple on /usr/share/legion_linux/acpi"
}
