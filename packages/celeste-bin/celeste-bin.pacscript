name="celeste-bin"
depends=("libgtk-3-0" "libayatana-appindicator3-1" "libadwaita-1-0" "rclone")
gives="celeste"
pkgdesc="GUI cloud file synchronization client"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver="0.5.4-rhino1"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="8b8f29804a1744fde930153c1880e364704a9d978dffaee565a5f4cdf441eda0"
else
  hash="5a11d81f4120de81ca484e6983d917aac99ae490a6a81a4d1fd4f8e88526e45c"
fi
url="https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip"

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

package() {
  sudo chmod +x "../usr/bin/${gives}"
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
