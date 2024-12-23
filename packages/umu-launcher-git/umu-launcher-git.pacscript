pkgname="umu-launcher-git"
repology=("project: umu-launcher")
arch=('all')
pkgver="1.1.4"
url='https://github.com/Open-Wine-Components/umu-launcher'
source=(
  "https://github.com/Open-Wine-Components/umu-launcher.git"
  "Makefile.patch"
)
sha256sums=(
  'SKIP'
  "26fde7fb612543ff26ec1937c2e8281bc0234bc6a11f7aea37b94daba967a472"
)
depends=(
  "python3"
  "python3-xlib>=0.33"
  "python3-six"
  "python3-filelock"
  "python3-urllib3>=2.0.0"
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
pkgdesc="A tool for launching non-steam games with Proton"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0-only')

prepare() {
  cd "${gives}"
  ./configure.sh --prefix=/usr

  # Apply Makefile patch to remove vendored dependency installation.
  # See: https://github.com/Open-Wine-Components/umu-launcher/issues/296
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
