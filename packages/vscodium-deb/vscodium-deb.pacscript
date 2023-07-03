name="vscodium-deb"
gives="codium"
breaks=("${gives}")
version="1.79.2.23166"
if [[ ${CARCH} == "arm64" ]]; then
  hash="7fbee66cc710f59649d421f1c9b11f3614dfb00dc92b942ec4fa39a455310f2f"
  arch=('arm64')
else
  hash="42de82a96c93c9116b1da0e7f2d429bfe0a72a4d295763d5c0a0b9c1450c6d99"
  arch=('amd64')
fi
url="https://github.com/VSCodium/vscodium/releases/download/${version}/${gives}_${version}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
description="Binary releases of VS Code without MS branding/telemetry/licensing"
