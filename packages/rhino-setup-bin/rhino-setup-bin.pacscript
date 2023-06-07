name="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="v1.4-beta5"
replace=("${gives}" "${gives}-git")

if [[ ${CARCH} == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="6eeae836a6b07909874af1d12edfc3537238abf8b9722f18cfe40d20511339d4"
  arch=('arm64')
else
  url="https://github.com/rhino-linux/${gives}/releases/download/${version}/${gives}_${version}_${CARCH}.zip"
  hash="19eb5b03c9c54410a6c1205c10dfc94ba407687c339b0377472280ba1f434740"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

install() {
  sudo chmod +x "../usr/local/bin/${gives}"
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
