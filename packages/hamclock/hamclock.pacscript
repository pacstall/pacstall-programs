name="hamclock"
pkgver="3.10"
url="https://github.com/kj7rrv/hamclock/archive/refs/tags/v${pkgver}.tar.gz"
homepage='https://clearskyinstitute.com/ham/HamClock'
makedepends=("gcc" "make" "pkg-config" "libxau6" "libx11-6" "libx11-dev" "libxcb1")
breaks=("hamclock-big" "hamclock-bigger" "hamclock-huge")
replace=("hamclock")
pkgdesc="Clock and world map with extra features for amateur radio (800x480 version)"
hash="49ee666ac5c2fd9c647119bf36a5d627f7fc8b1db22b0ad7140e9e60a30554c5"
maintainer="Roy Williams <fang64@gmail.com>"
repology=("project: ${name}")

prepare() {
  cd "ESPHamClock"
  # Add -PAC to version for PACSTALL
  sed -i 's/"/-PAC"/g' version.h
  sed -i 's/\t-PAC"/\t"/g' version.h

  # Do not check for/install updates
  sed -i "s/tft.print (F(\"You're up to date\!\"));"'/tft.print(F("Updates disabled for PACSTALL")); tft.setCursor (tft.width()\/8, tft.height()\/3+40); tft.print(F("If this build is outdated by more than a few days,")); tft.setCursor (tft.width()\/8, tft.height()\/3+80); tft.print(F("please email fang64@gmail.com.")); wdDelay(2000);/g' ESPHamClock.ino
  sed -i 's/bool found_newer = false;/return false;bool found_newer;/g' OTAupdate.cpp
}

build() {
  cd "ESPHamClock"
  make -j"${NCPU}" hamclock-800x480
}

package() {
  cd "ESPHamClock"
  sudo mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons" "${pkgdir}/usr/share/licenses/${pkgname}/"
  sudo cp hamclock-800x480 "${pkgdir}/usr/bin/hamclock"
  sudo cp hamclock.png "${pkgdir}/usr/share/icons"
  sudo cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  echo '[Desktop Entry]
Name=HamClock
Exec=hamclock
Icon=/usr/share/icons/hamclock.png
Terminal=false
Type=Application
Categories=HamRadio' | sudo tee "${pkgdir}/usr/share/applications/hamclock.desktop" > /dev/null
}
