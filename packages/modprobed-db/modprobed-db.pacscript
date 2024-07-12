pkgname="modprobed-db"
gives="modprobed-db"
pkgver="2.46"
pkgdesc="Keeps track of EVERY kernel module ever used - useful for make localmodconfig"
license=("MIT")
depends=("kmod")
optdepends=('sudo: needed for recall function')
replaces=("modprobed_db" "${pkgname}-git")
breaks=("modprobed_db")
url='https://wiki.archlinux.org/index.php/Modprobed-db'
source=("https://github.com/graysky2/${gives}/archive/v${pkgver}.tar.gz")
sha256sums=('34a0cd3fa67efea8a2ba657d90ce2f5e3ef480babb7f3bcae6c13bac1eb4eeab')

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 MIT "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
}

post_install() {
  function ecrire_en_orange() {
    local ORANGE="\033[0;33m"
    local BLANC="\033[0;37m"
    local texte=$1
    echo -e "${ORANGE}${texte}${BLANC}"
  }
  ecrire_en_orange '
-----------------------------------------------------------------------------------------------------------------------------'
  ecrire_en_orange '
--> The system service and timer have been deprecated in favor of user flavors.'
  ecrire_en_orange '--> See the manpage of modprobed for details.'
  ecrire_en_orange '
	- Create your fist database by running :'
  echo '
	modprobed-db && modprobed-db store'

  ecrire_en_orange '
	- Recommended modules need to be added manualy to your .config/modprobed.db file'
  echo '
	ext4, fat, vfat: to support common file systems and the EFI system partition
	loop: to mount a file as a file system
	isofs: to mount ISO files
	cifs: for network filesystems like Samba
	efivarfs: for mounting the UEFI#UEFI variables file system
	usb_storage: to support USB storage devices
	usbhid: to support USB input devices'
  ecrire_en_orange '
	- Add all this module in one command :
	'
  cat << 'EOF'
  echo -e "ext4\nfat\nvfat\nloop\nisofs\ncifs\nefivarfs\nusb_storage\nusbhid" >> /home/${LOGNAME}/.config/modprobed.db
EOF
  ecrire_en_orange '
-----------------------------------------------------------------------------------------------------------------------------'
}
