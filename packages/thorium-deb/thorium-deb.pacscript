name="thorium-deb"
gives="thorium-browser"
pkgver="122.0.6261.132"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Raspi/releases/download/M${pkgver}/${gives}_${pkgver}_arm64.deb"
  hash="3c1de6efa68d5221d3c2657e9ece54e4ea918fcf4bddeb50ae80b5b8756f194a"
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_SSE3.deb"
  hash="f51d36d2e9aca959b71d60f3b7d72ad315b3c968171a28ecda58bf8f672177ec"
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
