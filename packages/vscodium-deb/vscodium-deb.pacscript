name="vscodium-deb"
gives="codium"
breaks=("${gives}")
pkgver="1.85.1.23348"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="2dc9e8f85c60e07c72f7663f896b6c68517599e869fd96e99b9f5d85ef13b2ad"
else
  hash="28cdc4df80f8cfdb69532cae8b1b19515ce24290217c1fa97b1946ccf3e1f25a"
fi
url="https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing"
