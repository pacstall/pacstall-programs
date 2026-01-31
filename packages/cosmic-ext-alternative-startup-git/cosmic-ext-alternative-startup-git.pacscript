pkgname="cosmic-ext-alternative-startup-git"
pkgver="0.1.0"
url='https://github.com/Drakulix/cosmic-ext-alternative-startup'
pkgdesc="Alternative entry point for cosmic-session's compositor ipc interface"
license=(GPL-3.0-or-later)
provides=("cosmic-ext-alternative-startup")
makedepends=("cargo")
arch=("amd64" "arm64")
source=("https://github.com/Drakulix/cosmic-ext-alternative-startup.git")
external_connection=true

build() {
  cd "cosmic-ext-alternative-startup"
  cargo build --locked --release
}

package() {
  cd "cosmic-ext-alternative-startup"
  install -Dm755 target/release/cosmic-ext-alternative-startup -t "${pkgdir}/usr/bin/"
}
