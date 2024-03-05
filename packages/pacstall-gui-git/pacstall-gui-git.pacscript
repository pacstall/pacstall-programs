name="pacstall-gui-git"
depends=("yad" "sed" "adwaita-icon-theme" "policykit-1" "desktop-file-utils")
source=("https://github.com/cat-master21/pacstall-gui.git")
pkgver="0.0.1"
gives="pacstall-gui"
breaks=("${gives}" "${gives}-bin" "${gives}-deb")
pkgdesc="A gui for Pacstall written in bash."
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"

prepare() {
  sudo mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
}

package() {
  sudo install -Dm755 pacstall-gui "${pkgdir}/usr/bin/pacstall-gui"
  sudo install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/pacstall-gui/LICENSE"
  sudo mv -f ./pacstall-gui.desktop "${pkgdir}/usr/share/applications"
}

post_install() {
  sudo update-desktop-database -q
  sudo gtk-update-icon-cache
}
