_pkgname="lenovolegionlinux"
pkgname="${_pkgname}-git"
pkgver="1.c1e9b55"
pkgdesc="LenovoLegionLinux (LLL) brings additional drivers and tools for Lenovo Legion series laptops to Linux. PLEASE READ THE REPO BEFORE INSTALL THIS PACKAGE!!!"
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
pacdep=(python3-darkdetect)
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
  "Makefile-debian"
)
sha256sums=(
  'SKIP'
  '217fa78f0380669c91a565f3e414d0a8be0f7a7fdfd1e3839f213e86aa574a95'
  'e4452e50cabfd488e5b04af627187bae184ce72489a6785591c1b66710af7333'
)

prepare() {
  cd "${_pkgname}"
  sed -i "s/version = _VERSION/version = 1.0.0/g" "${srcdir}/${_pkgname}/python/legion_linux/setup.cfg"
}

build() {
  cd "${srcdir}/${_pkgname}/python/legion_linux"
  python3 -m build --wheel --no-isolation

  # Compile legiond daemon
  cd legion_linux/extra/service/legiond
  cp "${srcdir}/ini.c" ./
  cp "${srcdir}/Makefile-debian" ./Makefile
  make
}

package() {
  mkdir -p "${pkgdir}/etc/systemd/system"

  cd "${srcdir}/${_pkgname}/python/legion_linux"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl

  # Systemd service
  cd "${srcdir}/${_pkgname}/extra"
  install -Dm664 service/*.service "${pkgdir}/etc/systemd/system"
  install -Dm664 service/*.timer "${pkgdir}/etc/systemd/system"

  # legiond daemon
  install -Dm775 service/legiond/legiond "${pkgdir}/usr/bin"
  install -Dm775 service/legiond/legiond-ctl "${pkgdir}/usr/bin"
}

post_install() {
  echo "Default config files are present in /usr/share/legion_linux"
  echo "Frist install: Pls copy folder /usr/share/legion_linux to /etc/legion_linux"
  echo "Is also provided acpi exemple on /usr/share/legion_linux/acpi"
}
