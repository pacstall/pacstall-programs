name="celeste-bin"
depends=("libgtk-3-0" "libayatana-appindicator3-1" "libadwaita-1-0" "rclone")
gives="celeste"
description="GUI cloud file synchronization client"
maintainer="Oren Klopfer <oren@taumoda.com>"
version="0.5.3-rhino1"
replace=("${gives}" "${gives}-git")

if [[ ${CARCH} == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/v${version}/${gives}_v${version}_${CARCH}.zip"
  hash="132cc11dd043cf5d30b9dde021868a7969f0860cbd7eca2dc37caf1587e910ed"
  arch=('arm64')
else
  url="https://github.com/rhino-linux/${gives}/releases/download/v${version}/${gives}_v${version}_${CARCH}.zip"
  hash="5cb47ee446004ecd07178a18a4e68ef4eef86665f171856ad125fe9364be73cd"
  arch=('amd64')
fi

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

package() {
  sudo chmod +x "../usr/bin/${gives}"
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
