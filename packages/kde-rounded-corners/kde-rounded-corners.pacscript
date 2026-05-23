pkgname='kde-rounded-corners'
pkgdesc='Makes the window borders round'
pkgver='0.8.7'
gives='kde-rounded-corners'
repology=("project: ${gives}")
arch=('all')
breaks=("${gives}-git" "${gives}-deb")
url='https://github.com/matinlotfali/KDE-Rounded-Corners'
source=("https://github.com/matinlotfali/KDE-Rounded-Corners/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f753fe435d96cad6f5b543996eeb9a6f781fada34e77121ddef6ac5aced2f7d2')
license=('GPL-3.0-only')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
makedepends=('git' 'cmake' 'g++' 'extra-cmake-modules' 'kwin-dev>=4:6.0.0' 'qt6-base-private-dev' 'qt6-base-dev-tools' 'libkf6kcmutils-dev' 'libdrm-dev')
depends=('libdrm2' 'kwin-common>=4:6.0.0' 'libkf6kcmutils6' 'qt6-base-private-dev' 'qt6-base-dev-tools')

prepare() {
  mkdir "${srcdir}/KDE-Rounded-Corners-${pkgver}/build"
}

build() {
  cd "${srcdir}/KDE-Rounded-Corners-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release ..
  cmake --build . -j"${NCPU}"
}

package() {
  make -j"${NCPU}" -C "${srcdir}/KDE-Rounded-Corners-${pkgver}/build" DESTDIR="${pkgdir}" install
}
