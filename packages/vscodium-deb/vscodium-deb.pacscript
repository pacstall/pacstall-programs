name="vscodium-deb"
gives="codium"
breaks=("${gives}")
pkgver="1.88.0.24096"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="533972436f87cbb3d85b174657db8a753e2f14fa3830f8933a7dd46b02f92298"
else
  hash="8748954e044e070c42daa6651d60512b37f21fb7e7e8fcc8aa6546edbfd50659"
fi
url="https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing"
