name="thorium-deb"
gives="thorium-browser"
pkgver="114.0.5735.134"
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Special/releases/download/M${pkgver}-1/${gives}_${pkgver}_${CARCH}.deb"
  hash="dfebb2acadf3018875e1aab8e5b0d61e533953a87fff7c441ed8a33dd1c5a6f3"
  arch=("arm64")
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="9fc0ec9f690d9b9fec19e8f454a05da609e8bc7203790575f940f0292b71cf9a"
  arch=('amd64')
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
