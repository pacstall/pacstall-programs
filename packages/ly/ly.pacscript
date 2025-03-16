pkgname="ly"
repology=("project: ${pkgname}")
arch=('any')
pkgver="1.0.3"
url='https://codeberg.org/AnErrupTion/ly'
source=(
  "${pkgname}::https://codeberg.org/AnErrupTion/ly/archive/v${pkgver}.tar.gz"
  "config_dir-fix.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)
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

  # Without this patch, the config directory is set as ${pkgdir}/ly-git/etc when it should be /etc/ly-git
  patch build.zig "${srcdir}"/config_dir-fix.patch

  zig build
}

package() {
  cd "ly"
  zig build -Ddest_directory="${pkgdir}" installsystemd
}

post_install() {
  fancy_message info "Finished installation. To enable Ly, run sudo systemctl enable ly.service"
  fancy_message info "If you need to switch between ttys after Ly's start you also have to disable getty on Ly's tty to prevent 'login' from spawning on top of it by running sudo systemctl disable getty@tty2.service"
}
