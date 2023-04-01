name="rhino-setup-bin"
depends="gettext desktop-file-utils libadwaita-1-0"
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1.2-beta1"
replace="${gives} ${gives}-git"

if [[ $CARCH == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="43d872725d7a4536b66f7b9d22dff79822417343f0891af395ff69b91b23f15c"
  arch=('arm64');
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="cd1be4f716be170585b48af2af0933bdaca2b4bdf921f889b19e1577f40b7bc3"
  arch=('amd64');
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x ../usr/local/bin/${gives}
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
