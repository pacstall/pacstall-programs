pkgname="hamclock-huge"
arch=("any")
pkgver="4.20"
source=(
  "https://github.com/fang64/hamclock/archive/refs/tags/v${pkgver}.tar.gz"
  "hamclock.desktop"
)
url='https://clearskyinstitute.com/ham/HamClock'
makedepends=("gcc" "make" "pkg-config" "libxau6" "libx11-6" "libx11-dev" "libxcb1")
breaks=("hamclock" "hamclock-big" "hamclock-bigger")
replaces=("hamclock-huge" "${breaks[@]}")
pkgdesc="Clock and world map with extra features for amateur radio (3200x1920 version)"
sha256sums=(
  "612a49653ae4d4edd43e6840d1de513b536772ffc6d347821fed76a962cfbd0f"
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
  make -j"${NCPU}" hamclock-3200x1920
}

package() {
  cd "hamclock-${pkgver}/ESPHamClock"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/licenses/${gives}/"
  cp hamclock-3200x1920 "${pkgdir}/usr/bin/hamclock"
  cp hamclock.png "${pkgdir}/usr/share/icons"
  cp LICENSE "${pkgdir}/usr/share/licenses/${gives}"
  cp hamclock.desktop "${pkgdir}/usr/share/applications/hamclock.desktop"
  chmod -x "${pkgdir}/usr/share/applications/hamclock.desktop"
}
