pkgname=leftwm-git
pkgver="0.5.4.r29.g89f09638"
pkgdesc="A tiling window manager for the adventurer"
arch=('amd64' 'i386')
url="https://github.com/leftwm/leftwm"
pacdeps=('rust-bin')
depends=('libx11-6' 'libxinerama1')
makedepends=('libx11-dev' 'libxinerama-dev')
provides=('leftwm')
conflicts=('leftwm' 'leftwm-bin')
license=('MIT')
maintainer=("aKqir24 <aKqir24@github.com>")
source=("${pkgname}::git+https://github.com/leftwm/leftwm.git")
external_connection=true

prepare() {
  cd "${pkgname}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  cargo build -j"${NCPU}" --profile optimized --no-default-features --features=x11rb,lefthk,sys-log,leftwm-watchdog
}

package() {
  cd "${pkgname}/target/optimized"

  # Install binaries
  install -Dm755 leftwm leftwm-worker leftwm-state leftwm-check leftwm-command lefthk-worker -t "${pkgdir}/usr/bin/"

  # Install the themes and xsession
  install -d "${pkgdir}/usr/share/leftwm"
  cp -R ../../themes "${pkgdir}/usr/share/leftwm"

  install -Dm644 ../../leftwm.desktop -t "${pkgdir}/usr/share/xsessions/"
}
