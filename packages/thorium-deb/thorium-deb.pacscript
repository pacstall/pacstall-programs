name="thorium-deb"
gives="thorium-browser"
pkgver="120.0.6099.235"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/Alex313031/Thorium-Raspi/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="6685dee042747071186cddf4c8a028ec293fe3007a42b0308038e9f695b6d4e7"
else
  url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
  hash="510a985e59235ee6775647227b448da7800c9c18de99abd6d86edd2864f15407"
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
