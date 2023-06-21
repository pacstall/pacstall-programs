name="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1.4-beta6"
replace=("${gives}" "${gives}-git")

if [[ ${CARCH} == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="da695c3b953a0790d5ab9bbcc95e06741a02952c92e0086703944919da5a0df6"
  arch=('arm64')
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="8f25fc9896fbd5a7bcc43594690469b61ac3b3a2afe6f1ad2156c1ed237bb1fa"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x "../usr/local/bin/${gives}"
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
