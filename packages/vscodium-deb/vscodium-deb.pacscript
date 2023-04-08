name="vscodium-deb"
gives="codium"
breaks="${gives}"
version="1.77.0.23093"
if [[ ${CARCH} == "arm64" ]]; then
  hash="0c9aba9d68713516e72eecdeb6d26f14ecd0a5df2a7d9acd055f9edc5b70b205"
  arch=('arm64');
else
  hash="53011ce7dce5dae116885d0400a99f9f6e562af48d6d9c95581cfabc0fd5ef51"
  arch=('amd64');
fi
url="https://github.com/VSCodium/vscodium/releases/download/${version}/${gives}_${version}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="oklopfer <oren@taumoda.com>"
description="Binary releases of VS Code without MS branding/telemetry/licensing"
