name="rhino-setup-bin"
depends="gettext desktop-file-utils"
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1-beta1"
replace="${gives} ${gives}-git"

if [[ $CARCH == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="8f7e93ba65a55c0f19c0f945ab4a2f8e757c72e4c66db06a7a8352fe254a3fcb"
  arch=('arm64');
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="cbbb022436de4af7add3697585a295dc43af8330b72d2ad08362da76f9a82dc8"
  arch=('amd64');
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x ../usr/local/bin/${gives}
  sudo cp -rf ../usr "${pkgdir}/usr"
}
