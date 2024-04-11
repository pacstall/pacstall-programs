pkgname="gnome-shell-extension-installer-git"
gives="gnome-shell-extension-installer"
pkgver="1.7"
pkgdesc="A bash script to install and search extensions from extensions.gnome.org"
source=("https://github.com/brunelli/gnome-shell-extension-installer.git")
maintainer=("D-Brox <BroxZuka@protonmail.com>")
depends=("curl" "perl" "dbus")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
