pkgname="ly"
repology=("project: ${pkgname}")
arch=('any')
pkgver="1.4.1"
url='https://codeberg.org/fairyglade/ly'
source=("${pkgname}::https://codeberg.org/fairyglade/ly/archive/v${pkgver}.tar.gz")
sha256sums=("4d1c10422e6c5b8d5a795150e4c364c82404f900c1a04318b83fe8d81fade58b")
makedepends=("build-essential" "libpam0g-dev" "libxcb-xkb-dev")
pacdeps=("zig-bin")
conflicts=("${pkgname}-git")
replaces=("ly-git" "lightdm" "sddm")
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
  cd "${pkgname}" && zig build -j"${NCPU}"
}

package() {
  cd "ly"
  zig build -Ddest_directory="${pkgdir}" installexe -Dinit_system="${_INIT_SYSTEM}"
}

post_install() {
  cd "${srcdir}/ly/res"
  case "${_INIT_SYSTEM}" in
    "openrc")
      POST_SETUP_MSG=("rc-update add ly" "rc-update del agetty.tty2")
      chmod +x ly-openrc && cp -p ly-openrc /etc/init.d/ly
      ;;
    "runit")
      POST_SETUP_MSG=("ln -s /etc/sv/ly /var/service/" "rm /var/service/agetty-tty2")
      mkdir -p "/etc/runit/sv/ly"
      chmod +x ly-runit-service/run && chmod +x ly-runit-service/finish
      cp -r ly-runit-service /etc/runit/sv/ly
      ;;
    "s6")
      POST_SETUP_MSG=("s6-service add default ly-srv && s6-db-reload" "s6-rc -u change ly-srv")
      mkdir -p "/etc/s6-rc/sources/ly"
      cp -r ly-s6 /etc/s6-rc/sources/ly
      s6-rc-init -c /etc/s6-rc/compiled /run/s6-rc
      ;;
    "dinit")
      POST_SETUP_MSG=("sudo dinitctl enable ly" "sudo ${EDITOR} /etc/dinit.d/config/console.conf and modify ACTIVE_CONSOLES")
      cp ly-dinit /etc/dinit.d/ly
      ;;
    "sysvinit")
      POST_SETUP_MSG=("update-rc.d ly defaults" "sudo ${EDITOR} /etc/inittab and comment out the line containing tty2")
      chmod +x ly-sysvinit && cp -p ly-sysvinit /etc/init.d/
      ;;
    "systemd" | *)
      POST_SETUP_MSG=("sudo systemctl enable ly.service" "sudo systemctl disable getty@tty2.service")
      cp ly@.service /etc/systemd/system/ && cp ly-kmsconvt@.service /etc/systemd/system/
      ;;
  esac

  fancy_message info "Finished installation. To enable Ly, run '${POST_SETUP_MSG[0]}'"
  fancy_message info "If you need to switch between ttys after Ly's start you also have to disable getty on Ly's tty to prevent 'login' from spawning on top of it by running '${POST_SETUP_MSG[1]}'"
}
