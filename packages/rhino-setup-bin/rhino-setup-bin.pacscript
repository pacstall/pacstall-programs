name="rhino-setup-bin"
depends="gettext desktop-file-utils libadwaita-1-0"
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1.3-beta2"
replace="${gives} ${gives}-git"

if [[ $CARCH == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="cf59bbd1dc342c265694c48c05aa25d16b4c95df496e275ffa4aeeb16e25a9e7"
  arch=('arm64');
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="2d67356a997f0f78a5a99de5e9b3d74f7d9cf6930153ca130fe86f4aceebba7e"
  arch=('amd64');
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x ../usr/local/bin/${gives}
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
