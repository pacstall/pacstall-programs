pkgname="hamclock-huge"
pkgver="4.04"
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
  "fdc1a9b724d2189624f9213ac887e31ab2d089a8982e1a1198bec98202617c64"
  "df56e16e9bfab4a6259fd8e9fdffbe8f8d24ff395d2d27434dfd4bfe4adfa85d"
)
maintainer=("Roy Williams <fang64@gmail.com>")
repology=("project: ${pkgname}")

prepare() {
  cd "hamclock-${pkgver}/ESPHamClock"
  # Add -PAC to version for PACSTALL
  sed -i 's/"/-PAC"/g' version.h
  sed -i 's/\t-PAC"/\t"/g' version.h

  # Do not check for/install updates
  sed -i "s/tft.print (F(\"You're up to date\!\"));"'/tft.print(F("Updates disabled for PACSTALL")); tft.setCursor (tft.width()\/8, tft.height()\/3+40); tft.print(F("If this build is outdated by more than a few days,")); tft.setCursor (tft.width()\/8, tft.height()\/3+80); tft.print(F("please email fang64@gmail.com.")); wdDelay(2000);/g' ESPHamClock.ino
  sed -i 's/bool found_newer = false;/return false;bool found_newer;/g' OTAupdate.cpp
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
