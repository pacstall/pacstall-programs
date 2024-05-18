pkgname="hamclock-big"
pkgver="4.00"
pkgrel="2"
source=("https://github.com/kj7rrv/hamclock/archive/refs/tags/v${pkgver}.tar.gz")
url='https://clearskyinstitute.com/ham/HamClock'
makedepends=("gcc" "make" "pkg-config" "libxau6" "libx11-6" "libx11-dev" "libxcb1")
breaks=("hamclock" "hamclock-bigger" "hamclock-huge")
replaces=("hamclock-big")
pkgdesc="Clock and world map with extra features for amateur radio (1600x960 version)"
sha256sums=("1def12cf34d3486edb1c4fb0ec7f1a27cc1bda01ca811b6c0fefc68c4c98ab20")
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
  make -j"${NCPU}" hamclock-1600x960
}

package() {
  cd "hamclock-${pkgver}/ESPHamClock"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/licenses/${gives}/"
  cp hamclock-1600x960 "${pkgdir}/usr/bin/hamclock"
  cp hamclock.png "${pkgdir}/usr/share/icons"
  cp LICENSE "${pkgdir}/usr/share/licenses/${gives}"
  echo '[Desktop Entry]
Name=HamClock
Exec=hamclock
Icon=/usr/share/icons/hamclock.png
Terminal=false
Type=Application
Categories=HamRadio' | tee "${pkgdir}/usr/share/applications/hamclock.desktop" > /dev/null
}
