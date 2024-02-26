name="thorium-deb"
gives="thorium-browser"
pkgver="121.0.6167.204"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Raspi/releases/download/M${pkgver}/${gives}_${pkgver}_arm64.deb"
  hash="e831d8ef41ed472bd24b6465da93ba549723d4f3d3553645fd184846bcfcba03"
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_SSE3.deb"
  hash="bccac28f57c8edee29550e1a3e8387155a3bce6af5bfb871bceb18e9411f9f41"
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
