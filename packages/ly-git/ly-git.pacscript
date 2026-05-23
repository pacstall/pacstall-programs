pkgname=("ly-git")
repology=("project: ly")
arch=('any')
pkgver="1.5.0"
url='https://codeberg.org/fairyglade/ly'
source=("https://codeberg.org/fairyglade/ly.git")
sha256sums=('SKIP')
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

# Pick from: runit, systemd, sysvinit, openrc, s6, dinit
_INIT_SYSTEM="systemd"

prepare() {
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/etc"
}

build() {
  cd "ly" && zig build
}

package() {
  cd "ly"
  zig build -Ddest_directory="${pkgdir} installexe -Dinit_system=${_INIT_SYSTEM}"
}

post_install() {
  case "${_INIT_SYSTEM}" in
    "systemd") POST_SETUP_MSG=("sudo systemctl enable ly.service" "sudo systemctl disable getty@tty2.service");;
    "openrc") POST_SETUP_MSG=("rc-update add ly" "rc-update del agetty.tty2");;
    "runit") POST_SETUP_MSG=("ln -s /etc/sv/ly /var/service/" "rm /var/service/agetty-tty2");;
    "s6") POST_SETUP_MSG=("s6-service add default ly-srv && s6-db-reload" "s6-rc -u change ly-srv");;
    "dinit") POST_SETUP_MSG=("dinitctl enable ly" "sudo ${EDITOR} /etc/dinit.d/config/console.conf and modify ACTIVE_CONSOLES");;
    "sysvinit") POST_SETUP_MSG=("update-rc.d ly defaults" "sudo ${EDITOR} /etc/inittab and comment out the line containing tty2")
  esac

  fancy_message info "Finished installation. To enable Ly, run ${POST_SETUP_MSG[0]}"
  fancy_message info "If you need to switch between ttys after Ly's start you also have to disable getty on Ly's tty to prevent 'login' from spawning on top of it by running ${POST_SETUP_MSG[1]}"
}
