pkgname="grub-customizer-git"
gives="grub-customizer"
pkgver="5.25"
pkgdesc="A graphical grub2 settings manager (git version)"
arch=('amd64')
url='https://git.launchpad.net/grub-customizer'
depends=("libgtkmm-3.0-dev" "libssl-dev")
makedepends=("libgtkmm-3.0-dev"
  "libssl-dev"
  "libcairomm-1.0-dev"
  "cmake"
  "libglib2.0-dev"
  "libglibmm-2.4-dev"
  "libgtk-3-dev"
  "libarchive-dev"
  "libsigc++-3.0-dev"
  "libpangomm-1.4-dev"
  "gettext")
pacdeps=("hwinfo-git")
replaces=("${gives}")
source=("git+https://git.launchpad.net/grub-customizer")
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")

build() {
  cd "${srcdir}/${gives}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev \
    -B build
  make VERBOSE=1 -C build -j"${NCPU}"
}

package() {
  cd "${srcdir}/${gives}"
  make install DESTDIR="${pkgdir}" -C "${srcdir}/${gives}/build"
  # additional documentation
  install -vDm 644 "${srcdir}/${gives}"/{changelog,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
