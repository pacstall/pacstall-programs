name="celeste-bin"
depends=("libgtk-3-0" "libayatana-appindicator3-1" "libadwaita-1-0" "rclone")
gives="celeste"
pkgdesc="GUI cloud file synchronization client"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver="0.5.5"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="0c4aa9bbd577f59758beb69c2bcf3d6e5ce262bf5f1c9063d447a4106b4fef21"
else
  hash="86b5a05d06d2a9a5b903aee3b14295c4233246e9cb25534d64e9ea46b78e80a8"
fi
url="https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip"

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

package() {
  sudo chmod +x "../usr/bin/${gives}"
  sudo cp -rf ../usr/* "${pkgdir}/usr"
}
