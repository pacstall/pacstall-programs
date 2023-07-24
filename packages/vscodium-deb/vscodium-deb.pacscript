name="vscodium-deb"
gives="codium"
breaks=("${gives}")
version="1.80.1.23194"
if [[ ${CARCH} == "arm64" ]]; then
  hash="a73d7bf180b2f7cb8a77bb4b932ae8f05a00305828438149c20e3f404c0c0b97"
  arch=('arm64')
else
  hash="d4a2e58db323de5c30b4144e65ca8492d4053aed8345263fc4e4603dbe188445"
  arch=('amd64')
fi
url="https://github.com/VSCodium/vscodium/releases/download/${version}/${gives}_${version}_${CARCH}.deb"
repology=("project: vscodium")
maintainer="Oren Klopfer <oren@taumoda.com>"
description="Binary releases of VS Code without MS branding/telemetry/licensing"
