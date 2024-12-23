pkgname="umu-launcher-git"
repology=("project: umu-launcher")
arch=('all')
pkgver="1.1.4"
url='https://github.com/Open-Wine-Components/umu-launcher'
source=("https://github.com/Open-Wine-Components/umu-launcher.git")
depends=(
  "python3"
  "python3-xlib"
  "python3-six"
  "python3-filelock"
  "apparmor-profiles"
)
makedepends=(
  "git"
  "scdoc"
  "python3-pip"
  "python3-build"
  "python3-hatchling"
  "python3-installer"
)
gives="umu-launcher"
pkgdesc="A tool for launching non-steam games with Proton."
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0-only')
external_connection=true

prepare() {
  cd "${gives}"
  ./configure.sh --prefix=/usr
}

build() {
  cd "${gives}"
  make -j"${NCPU}"
}

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}" install
}
