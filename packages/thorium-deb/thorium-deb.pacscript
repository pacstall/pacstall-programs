name="thorium-deb"
gives="thorium-browser"
pkgver="115.0.5790.172"
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Raspi/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="ef5d78990afd676aa1a5c090493f3155db10c45b6978691bc0c326256b9b03e4"
  arch=("arm64")
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="10fe1bd39e52a95fe1d155d89a1c0a19519ecc57f4ac8162b6d47ba271103450"
  arch=('amd64')
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
