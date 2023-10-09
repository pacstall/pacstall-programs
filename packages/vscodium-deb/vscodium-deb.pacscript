name="vscodium-deb"
gives="codium"
breaks=("${gives}")
pkgver="1.83.0.23277"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="5163fa4b5b95d06a15ffca7fe12b2c599f0a18b69fa25711188b60fd353d8699"
else
  hash="b38fe5053f6af95fb87de48454a0f2298b435719ad2c3c2acf94537cdb847b39"
fi
url="https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing"
