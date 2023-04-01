name="vscodium-deb"
gives="codium"
breaks="${gives}"
version="1.76.2.23074"
if [[ ${CARCH} == "arm64" ]]; then
  hash="13c4a0ae8510d0b6a67ffc27b57341b056fd44322b4b3f38affc0369ae3491e3"
  arch=('arm64');
else
  hash="cfb9e6a66553a9bd242ba502fc029ff115161c84b61dd68c390fd2b3157ac499"
  arch=('amd64');
fi
url="https://github.com/VSCodium/vscodium/releases/download/${version}/${gives}_${version}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="oklopfer <oren@taumoda.com>"
description="Binary releases of VS Code without MS branding/telemetry/licensing"
