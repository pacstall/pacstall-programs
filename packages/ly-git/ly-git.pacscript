pkgname=("ly-git")
repology=("project: ly")
arch=('any')
pkgver="1.5.0"
url='https://codeberg.org/fairyglade/ly'
source=("https://codeberg.org/fairyglade/ly.git")
sha256sums=('SKIP')
depends=("systemd")
makedepends=("build-essential" "libpam0g-dev" "libxcb-xkb-dev")
pacdeps=("zig-bin")
gives="ly"
conflicts=("${gives}")
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
  zig build
}

package() {
  cd "ly"
  case "$(ps -p 1 -o comm=)" in
    "init")
        init="sysvinit"
        depends=("sysvinit")
        ;;
    "systemd")
        init="systemd"
        depends=("systemd")
        ;;
    "openrc"|"runit-init")
        init="openrc"
        depends=("openrc")
        ;;
    *)
        # Fallback/Catch-all for unknown or custom init systems
        fancy_message error "Unknown init system detected." >&2
        ;;
  esac
  zig build -Ddest_directory="${pkgdir}" installexe -Dinit_system=$init
}

post_install() {
  fancy_message info "Finished installation. To enable Ly, run sudo systemctl enable ly.service"
  fancy_message info "If you need to switch between ttys after Ly's start you also have to disable getty on Ly's tty to prevent 'login' from spawning on top of it by running sudo systemctl disable getty@tty2.service"
}
