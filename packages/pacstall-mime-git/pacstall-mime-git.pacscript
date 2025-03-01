pkgname="pacstall-mime-git"
gives="${pkgname%-git}"
source=("${gives}::https://github.com/pacstall/pacmime.git")
arch=("all")
depends=("xdg-utils" "desktop-file-utils" "shared-mime-info")
optdepends=("gtk-update-icon-cache: GTK-based environments")
pkgver="0.0.1"
pkgdesc="Minimal files for pacscript MIME integration on desktop environments"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${gives}"
  install -Dm644 "application-x-pacscript.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes"
  install -Dm644 "pacscript.xml" -t "${pkgdir}/usr/share/mime/packages"
  install -Dm644 "pacscript.desktop" -t "${pkgdir}/usr/share/applications"
}

post_install() {
  sudo update-mime-database "/usr/share/mime" 2> /dev/null
  sudo update-desktop-database "/usr/share/applications"
  if command -v update-icon-caches > /dev/null; then
    sudo update-icon-caches "/usr/share/icons/hicolor"
  fi
  if ! { [[ -f "/usr/share/applications/mimeapps.list" ]] \
    && grep -q '^application/x-pacscript=' "/usr/share/applications/mimeapps.list"; }; then
    {
      ! [[ -f "/usr/share/applications/mimeapps.list" ]] && echo -e '\n[Default Applications]'
      echo 'application/x-pacscript=pacscript.desktop'
    } | sudo tee -a "/usr/share/applications/mimeapps.list" > /dev/null
  fi
}

post_remove() {
  sudo update-mime-database "/usr/share/mime" 2> /dev/null
  sudo update-desktop-database "/usr/share/applications"
  if command -v update-icon-caches > /dev/null; then
    sudo update-icon-caches "/usr/share/icons/hicolor"
  fi
  if [[ -f "/usr/share/applications/mimeapps.list" ]]; then
    sudo sed -i '/application\/x-pacscript=pacscript\.desktop/d' "/usr/share/applications/mimeapps.list"
  fi
}
