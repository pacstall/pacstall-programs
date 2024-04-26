name="thorium-deb"
gives="thorium-browser"
pkgver="123.0.6312.133"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Raspi/releases/download/M${pkgver}/${gives}_${pkgver}_arm64.deb"
  hash="f204ee72c949d98e19c71114ea7bf4a0dc19e351bc168050154e26444372c868"
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_SSE3.deb"
  hash="cbb2d6a1b6a70130242c6a5856c5e07e68a8c4f10e86fb24bf10c82b4dd4a262"
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
