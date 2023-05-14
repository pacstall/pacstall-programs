name="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1.3-beta5"
replace=("${gives}" "${gives}-git")

if [[ $CARCH == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="b036d9c628ef8cd90d88a8af5c8c4637d2ecd884008c55166bcc262ef82a5b07"
  arch=('arm64')
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="175a0f71854099cccca1a4cdc470f5ea2363a445b3c83706c9cdba6d2bb3d67b"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x ../usr/local/bin/${gives}
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
