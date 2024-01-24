name="vscodium-deb"
gives="codium"
breaks=("${gives}")
pkgver="1.85.2.24019"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="860ce849c3c99828e5675a7e0e679a47eaa349e0b5bb7122fe4769104d5f78e7"
else
  hash="608192d9abab899d3ed787590f86da7dc18151d1618a3455ff25e580503d58cb"
fi
url="https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing"
