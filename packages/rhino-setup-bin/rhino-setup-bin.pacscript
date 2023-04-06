name="rhino-setup-bin"
depends="gettext desktop-file-utils libadwaita-1-0"
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1.2-beta2"
replace="${gives} ${gives}-git"

if [[ $CARCH == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="96b7cdc1ac5ea807ad8b2016c19b2bbef98afdbf5dc41aaceae6621efefb9509"
  arch=('arm64');
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="ac382a15b1a8ceb6b4557841bd1211ad1cd5d8643f5634d61da0b89cb3a4e3c8"
  arch=('amd64');
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x ../usr/local/bin/${gives}
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
