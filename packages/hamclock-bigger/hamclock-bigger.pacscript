pkgname="hamclock-bigger"
arch=("any")
pkgver="4.19"
source=(
  "https://github.com/fang64/hamclock/archive/refs/tags/v${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/fang64/hamclock/refs/heads/patch/pacstall/no-updates.patch"
  "hamclock.desktop"
)
url='https://clearskyinstitute.com/ham/HamClock'
makedepends=("gcc" "make" "pkg-config" "libxau6" "libx11-6" "libx11-dev" "libxcb1")
breaks=("hamclock" "hamclock-big" "hamclock-huge")
replaces=("hamclock-bigger" "${breaks[@]}")
pkgdesc="Clock and world map with extra features for amateur radio (2400x1440 version)"
sha256sums=(
  "370d1f020c06028b35fc12a63ac26be2ab75c46b2319593349018beb5e5587df"
  "03dece6363a7109d3178eec7d88dafe3cea920c471d0076372acefade89294fd"
  "df56e16e9bfab4a6259fd8e9fdffbe8f8d24ff395d2d27434dfd4bfe4adfa85d"
)
maintainer=("Roy Williams <fang64@gmail.com>")
repology=("project: ${pkgname}")

prepare() {
  cd "hamclock-${pkgver}/ESPHamClock"
  # Add -PAC to version for PACSTALL
  sed -i 's/";/-PAC";/g' version.cpp

  # Do not check for/install updates
  patch -Np1 -i "${srcdir}/no-updates.patch"
}

build() {
  cd "hamclock-${pkgver}/ESPHamClock"
  make -j"${NCPU}" hamclock-2400x1440
}

package() {
  cd "hamclock-${pkgver}/ESPHamClock"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/licenses/${gives}/"
  cp hamclock-2400x1440 "${pkgdir}/usr/bin/hamclock"
  cp hamclock.png "${pkgdir}/usr/share/icons"
  cp LICENSE "${pkgdir}/usr/share/licenses/${gives}"
  cp hamclock.desktop "${pkgdir}/usr/share/applications/hamclock.desktop"
  chmod -x "${pkgdir}/usr/share/applications/hamclock.desktop"
}
