pkgname="rhino-lomiri-default-settings-git"
gives="${pkgname%-git}"
source=("https://github.com/rhino-linux/${gives#rhino-}.git")
arch=("all")
pkgver="0.0.1"
pkgdesc="Rhino Linux branding for Lomiri Desktop"
maintainer=("Oren Klopfer <oren@taumoda.com>")
depends=("lomiri-schemas" "desktop-base" "dconf-gsettings-backend | gsettings-backend" "qmltermwidget-common")
pacdeps=("rhino-branding-git" "rhino-wallpapers-git" "rhino-kvantum-theme-git" "rhino-adwaita-theme-git")

pre_install() {
  sudo dpkg-divert --quiet --package "${gives}" --divert /usr/share/QMLTermWidget/color-schemes/Ubuntu-upstream.colorscheme --rename /usr/share/QMLTermWidget/color-schemes/Ubuntu.colorscheme
}

package() {
  install -Dm644 "${gives#rhino-}"/10_rhino-lomiri.gschema.override -t "${pkgdir}/usr/share/glib-2.0/schemas"
  install -Dm644 "${gives#rhino-}"/Rhino.colorscheme -t "${pkgdir}/usr/share/QMLTermWidget/color-schemes"
  ln -sf "/usr/share/QMLTermWidget/color-schemes/Rhino.colorscheme" "${pkgdir}/usr/share/QMLTermWidget/color-schemes/Ubuntu.colorscheme"
}

post_remove() {
  if ! [[ -d "${STAGEDIR}/${pkgname}" ]]; then
    sudo dpkg-divert --quiet --package "${gives}" --remove --rename /usr/share/QMLTermWidget/color-schemes/Ubuntu.colorscheme
  fi
}
