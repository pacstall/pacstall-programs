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
pacdeps=("${_pkgname}-git")
replaces=("${_pkgname}-dkms")
source=("${_pkgname}::git+https://github.com/johnfanv2/LenovoLegionLinux")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}/kernel_module/"
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/"${_pkgname}"-1.0.0/dkms.conf
  cp -r {issue-warning.sh,legion-laptop-unused-snippets.c,legion-laptop.c,Makefile} "${pkgdir}"/usr/src/"${_pkgname}"-1.0.0/
}

post_install() {
  RED='\033[0;31m'
  BOLD=$(tput bold)
  echo -e "${RED} ${BOLD} If you have a 2022 or 2023 model, please help testing the new features '\e]8;;https://github.com/johnfanv2/LenovoLegionLinux/issues/46\ahere\e]8;;\a'"
}

post_remove() {
  RED='\033[0;31m'
  BOLD=$(tput bold)
  echo -e "${RED} ${BOLD} If you have a 2022 or 2023 model, please help testing the new features '\e]8;;https://github.com/johnfanv2/LenovoLegionLinux/issues/46\ahere\e]8;;\a'"
}
