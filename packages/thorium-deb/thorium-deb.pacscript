name="thorium-deb"
gives="thorium-browser"
pkgver="119.0.6045.214"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Raspi/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="811dded7557b0ca9a93c3a50e5ce6658f2d185b9858443a76d359485598856b5"
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="5e4f5ffb357ae37dbb3dc3ed2da46cd47781037d3cd6f3cb59d77572724f8e5a"
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
