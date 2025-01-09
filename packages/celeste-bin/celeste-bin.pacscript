pkgname="celeste-bin"
depends=("libgtk-3-0" "libayatana-appindicator3-1" "libadwaita-1-0" "rclone")
gives="celeste"
pkgdesc="GUI cloud file synchronization client"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgver="0.8.0"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
sha256sums_arm64=("f8a1d65fe5f21e5dfa90ad6450f8124bf631e5d78f3b409b4e6d99ed007ebba4")
sha256sums_amd64=("c844eff69ae5c5c8908b17a87f36ded77b1807976411efbab4f8401385c17a31")
source=("https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip")

build() {
  mkdir -p "${pkgdir}/usr"
}

package() {
  chmod +x "usr/bin/${gives}"
  cp -rf usr/* "${pkgdir}/usr"
}
