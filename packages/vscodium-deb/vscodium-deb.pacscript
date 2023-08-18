name="vscodium-deb"
gives="codium"
breaks=("${gives}")
pkgver="1.81.1.23222"
if [[ ${CARCH} == "arm64" ]]; then
  hash="a74276c5ee5d4d8fd62e0dad85924c369c9d9c4180149e02c11819c971802195"
  arch=('arm64')
else
  hash="8d2324783b39ca8fea127c3d8c83f423c67782b7f143e1936e9c86187c86b2b0"
  arch=('amd64')
fi
url="https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing"
