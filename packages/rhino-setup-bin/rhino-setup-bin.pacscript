name="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
version="1.5-beta7"
replace=("${gives}" "${gives}-git")

if [[ ${CARCH} == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/v${version}/${gives}_v${version}_${CARCH}.zip"
  hash="3cf52a0d9cfa6b418db0067dc0cbfc00b6f69465b649f5a235dc802522f4b64c"
  arch=('arm64')
else
  url="https://github.com/rhino-linux/${gives}/releases/download/v${version}/${gives}_v${version}_${CARCH}.zip"
  hash="5455bd4eb60fb3b75c8320ef4bbd0b26f6cbdfe0677b803b0e05cd791431583c"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

package() {
  sudo chmod +x "../usr/local/bin/${gives}"
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
