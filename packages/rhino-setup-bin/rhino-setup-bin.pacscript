name="rhino-setup-bin"
depends="gettext desktop-file-utils libadwaita-1-0"
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1.1-beta1"
replace="${gives} ${gives}-git"

if [[ $CARCH == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="8f2585283512aeffacb56631051ce800212c74009c143f954186e070299be6bb"
  arch=('arm64');
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="e91782babe0e1fc3bd621c33e98bc05a18c32cc241303802702cf773ce4218a7"
  arch=('amd64');
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x ../usr/local/bin/${gives}
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
