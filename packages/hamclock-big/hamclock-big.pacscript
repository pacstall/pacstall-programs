pkgname="hamclock-big"
arch=("any")
pkgver="4.21"
source=(
  "https://github.com/fang64/hamclock/archive/refs/tags/v${pkgver}.tar.gz"
  "hamclock.desktop"
)
url='https://clearskyinstitute.com/ham/HamClock'
makedepends=("gcc" "make" "pkg-config" "libxau6" "libx11-6" "libx11-dev" "libxcb1")
breaks=("hamclock" "hamclock-bigger" "hamclock-huge")
replaces=("hamclock-big" "${breaks[@]}")
pkgdesc="Clock and world map with extra features for amateur radio (1600x960 version)"
sha256sums=(
  "0349f395e3b889280dc30bf5d285b168b10f65459de08c0aab06882e76b1144b"
  "df56e16e9bfab4a6259fd8e9fdffbe8f8d24ff395d2d27434dfd4bfe4adfa85d"
)
maintainer=("Roy Williams <fang64@gmail.com>")
repology=("project: ${pkgname}")

prepare() {
  cd "hamclock-${pkgver}/ESPHamClock"
  # Add -PAC to version for PACSTALL
  sed -i 's/";/-PAC";/g' version.cpp

  # Set NO_UPGRADE definition this will disable updates
  sed -i '18 i CXXFLAGS += -DNO_UPGRADE' Makefile
}

build() {
  cd "hamclock-${pkgver}/ESPHamClock"
  make -j"${NCPU}" hamclock-1600x960
}

package() {
  cd "hamclock-${pkgver}/ESPHamClock"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/licenses/${gives}/"
  cp hamclock-1600x960 "${pkgdir}/usr/bin/hamclock"
  cp hamclock.png "${pkgdir}/usr/share/icons"
  cp LICENSE "${pkgdir}/usr/share/licenses/${gives}"
  cp ../../hamclock.desktop "${pkgdir}/usr/share/applications/hamclock.desktop"
  chmod -x "${pkgdir}/usr/share/applications/hamclock.desktop"
}
