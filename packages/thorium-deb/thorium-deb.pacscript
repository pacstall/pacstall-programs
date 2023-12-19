name="thorium-deb"
gives="thorium-browser"
pkgver="117.0.5938.157"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Raspi/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="526c851d042702e5648ae959d60f7956c68473481bc5e507cdb1db7f0e9dac14"
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="9ae34160febcdf63e63f47adf4449a46977f048c18666c1d90786c30d04b404e"
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
