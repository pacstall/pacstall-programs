pkgname="umu-launcher-git"
gives="umu-launcher"
repology=("project: ${gives}")
arch=('any')
pkgver="1.1.4"
url='https://github.com/Open-Wine-Components/umu-launcher'
source=(
  "https://github.com/Open-Wine-Components/umu-launcher.git"
  "Makefile.patch"
)
depends=(
  "python3"
  "python3-xlib>=0.33"
  "python3-six"
  "python3-filelock"
  "python3-urllib3>=2.0.0"
  "python3-pyzstd"
  "apparmor-profiles"
)
makedepends=(
  "git"
  "scdoc"
  "python3-pip"
  "python3-build"
  "python3-hatchling"
  "python3-installer"
  "cargo"
)
pacdeps=("rust-bin")
pkgdesc="Tool for launching non-steam games with Proton"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0-only')
external_connection=true

prepare() {
  cd "${gives}"
  ./configure.sh --prefix=/usr --use-system-pyzstd --use-system-urllib

  patch Makefile.in "${srcdir}"/Makefile.patch
}

build() {
  cd "${gives}"
  make -j"${NCPU}"
}

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}" install
}
