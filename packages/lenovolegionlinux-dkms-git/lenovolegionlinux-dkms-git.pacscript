_pkgname="lenovolegionlinux"
pkgname="${_pkgname}-dkms-git"
pkgver="1.c1e9b55"
pkgdesc="LenovoLegionLinux (LLL) DKMS module"
arch=("amd64")
url='https://github.com/johnfanv2/LenovoLegionLinux'
maintainer=("MrDuartePT <gonegrier.duarte@gmail.com>")
license=('GPL-2.0-only')
makedepends=(
  "git"
  "lm-sensors"
  "i2c-tools"
  "dmidecode"
)
depends=("dkms")
pacdep=("${_pkgname}-git")
replaces=("${_pkgname}-dkms")
source=("${_pkgname}::git+https://github.com/johnfanv2/LenovoLegionLinux")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}/kernel_module/"
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/"${_pkgname}"-1.0.0/dkms.conf
  cp -r {issue-warning.sh,legion-laptop-unused-snippets.c,legion-laptop.c,Makefile} "${pkgdir}"/usr/src/"${_pkgname}"-1.0.0/

  cd "${srcdir}/${_pkgname}/deploy/"
  install -Dm644 LenovoLegionLinux.hook "${pkgdir}"/etc/pacman.d/hooks/LenovoLegionLinux.hook
  install -Dm775 LenovoLegionLinux "${pkgdir}"/usr/bin/LenovoLegionLinux
}

post_install() {
  rmmod legion-laptop.ko #unload old module
  echo Installation Finished!
  echo Reboot the system or run modprobe legion-laptop to load the module!
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  rmmod legion-laptop.ko #unload old module
  echo Uninstall finished.
  echo Reboot the system.
  RED='\033[0;31m'
  BOLD=$(tput bold)
  echo -e "${RED} ${BOLD} If you have a 2022 or 2023 model, please help testing the new features '\e]8;;https://github.com/johnfanv2/LenovoLegionLinux/issues/46\ahere\e]8;;\a'"
}
