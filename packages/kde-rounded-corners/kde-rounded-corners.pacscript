pkgname="kde-rounded-corners"
pkgdesc="Makes the window borders round"
pkgver="0.8.5"
gives="kde-rounded-corners"
repology=("project: ${gives}")
arch=("all")
breaks=("${gives}-git" "${gives}-deb")
url='https://github.com/matinlotfali/KDE-Rounded-Corners'
source=("https://github.com/matinlotfali/KDE-Rounded-Corners/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("363dab6461c1bcb25331e2e99350987f8d29a95c9fb74fd7956a76bf5dc678f2")
license=("GPL-3.0-only")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
makedepends=("git" "cmake" "g++" "extra-cmake-modules" "kwin-dev>=4:6.0.0" "qt6-base-private-dev" "qt6-base-dev-tools" "libkf6kcmutils-dev" "libdrm-dev")
depends=("libdrm2" "kwin-common>=4:6.0.0" "libkf6kcmutils6" "qt6-base-private-dev" "qt6-base-dev-tools")

prepare() {
  cd "${srcdir}/KDE-Rounded-Corners-${pkgver}"
  mkdir build
  cd build
  cmake ..
  cmake --build . -j
}

package() {
  make -C "${srcdir}/KDE-Rounded-Corners-${pkgver}/build" DESTDIR="${pkgdir}" install
}
