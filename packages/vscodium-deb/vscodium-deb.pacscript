name="vscodium-deb"
gives="codium"
breaks=("${gives}")
pkgver="1.84.2.23314"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="0dcf55087bbf7b2a23649b4117e2be9f8d5924fc287b75b92024bfdac97d837f"
else
  hash="64c40d1772570bfd1f1550b2000e6eefda644c72a67b0842d4d5602076c7f2fa"
fi
url="https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing"
