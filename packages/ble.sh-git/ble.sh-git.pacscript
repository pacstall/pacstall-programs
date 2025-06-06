# Adapted from the AUR blesh-git package by Koichi Murase and capezotte
# https://aur.archlinux.org/packages/blesh-git

pkgname="ble.sh-git"
pkgdesc="Replacement for Bash's line editor with enhanced features"
gives="ble.sh"
repology=("project: blesh")
arch=("all")
breaks=("${gives}")
url='https://github.com/akinomyoga/ble.sh'
pkgver="0.4.0-devel3"

source=("https://github.com/akinomyoga/${gives}.git")

depends=("bash")
makedepends=("shfmt" "make" "gawk")
optdepends=(
  "mawk: for faster processing"
)

license=("BSD-3-Clause")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")

package() {
  TMP=$(mktemp --suffix=".sh")
  echo "
    _ble_base_package_type=pacstall

    function ble/base/package:pacstall/update {
      pacstall --install ${pkgname}
    }
    " | shfmt > "${TMP}"
  install -Dm644 "${TMP}" "${pkgdir}"/usr/share/blesh/lib/_package.sh
  make -C "${gives}" -j"${NCPU}" install DESTDIR="${pkgdir}" PREFIX=/usr INSDIR_LICENSE="${pkgdir}/usr/share/licenses/blesh"
  rm "${TMP}"
}

check() {
  make -C "${gives}" check-all
}

post_install() {
  BLE_SH="$(dpkg-query -L "${gives}" | grep -m 1 ble.sh)"
  fancy_message info "Installation successful! You will have to add 'source ${BLE_SH}' to your .bashrc to activate it."
}
