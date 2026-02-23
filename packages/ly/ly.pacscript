pkgname="ly"
repology=("project: ${pkgname}")
arch=('any')
pkgver="1.3.2"
url='https://codeberg.org/fairyglade/ly'
source=("${pkgname}::https://codeberg.org/fairyglade/ly/archive/v${pkgver}.tar.gz")
sha256sums=("db069cc2dcacc64b2890552a10ec8547aee4f9b9e5b0bc6b07c3d5d431a757e6")
depends=("systemd")
makedepends=("build-essential" "libpam0g-dev" "libxcb-xkb-dev")
pacdeps=("zig-bin")
conflicts=("${pkgname}-git")
replaces=("lightdm" "sddm")
pkgdesc="TUI display manager"
priority='required'
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('WTFPL')
external_connection=true

prepare() {
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/etc"
}

build() {
  cd "ly"

  zig build -j"${NCPU}"
}

package() {
  cd "ly"
  zig build -Ddest_directory="${pkgdir}" installexe
}

post_install() {
  fancy_message info "Finished installation. To enable Ly, run sudo systemctl enable ly.service"
  fancy_message info "If you need to switch between ttys after Ly's start you also have to disable getty on Ly's tty to prevent 'login' from spawning on top of it by running sudo systemctl disable getty@tty2.service"
}
