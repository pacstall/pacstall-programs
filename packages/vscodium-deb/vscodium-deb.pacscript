name="vscodium-deb"
gives="codium"
breaks=("${gives}")
version="1.78.2.23132"
if [[ ${CARCH} == "arm64" ]]; then
  hash="37b2ae2c9b040f9e24d54b8d853190428b9c1b2ff5f6b0a78a69686dd0712dfb"
  arch=('arm64')
else
  hash="5f8723d1f82b938780725a009c0c4f0f4cf41644800a122b1501b99d1eb0851a"
  arch=('amd64')
fi
url="https://github.com/VSCodium/vscodium/releases/download/${version}/${gives}_${version}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="oklopfer <oren@taumoda.com>"
description="Binary releases of VS Code without MS branding/telemetry/licensing"
