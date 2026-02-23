pkgname="rhino-lomiri-default-settings-git"
gives="${pkgname%-git}"
source=("https://github.com/rhino-linux/${gives#rhino-}.git")
arch=("all")
pkgver="0.0.1"
pkgdesc="Rhino Linux branding for Lomiri Desktop"
maintainer=("Oren Klopfer <oren@taumoda.com>")
depends=("lomiri-schemas" "desktop-base" "dconf-gsettings-backend | gsettings-backend" "qmltermwidget-common")
pacdeps=("rhino-branding-git" "rhino-wallpapers-git" "rhino-kvantum-theme-git" "rhino-adwaita-theme-git")

package() {
  install -Dm644 "${gives#rhino-}"/10_rhino-lomiri.gschema.override -t "${pkgdir}/usr/share/glib-2.0/schemas"
  install -Dm644 "${gives#rhino-}"/Rhino.colorscheme -t "${pkgdir}/usr/share/QMLTermWidget/color-schemes"
}

post_install() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  for i in gtk-3.0 gtk-4.0; do
    if [[ -f "/usr/share/branding/rhino/${i}/gtk.css" ]]; then
      if [[ -f "${homedir}/.config/${i}/gtk.css" && ! -f "${homedir}/.config/${i}/gtk.css-unicorn.bak" ]]; then
        mv "${homedir}/.config/${i}/gtk.css" "${homedir}/.config/${i}/gtk.css-unicorn.bak"
        cp -r "/usr/share/branding/rhino/${i}" "${homedir}/.config"
      elif [[ ! -f "${homedir}/.config/${i}/gtk.css-unicorn.bak" ]]; then
        cp -r "/usr/share/branding/rhino/${i}" "${homedir}/.config"
      fi
      sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/${i}"
    fi
  done
}
