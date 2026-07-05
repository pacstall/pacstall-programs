pkgname="rhino-lomiri-default-settings-git"
gives="${pkgname%-git}"
source=("https://github.com/rhino-linux/${gives#rhino-}.git")
arch=("all")
pkgver="0.0.1"
pkgrel="3"
pkgdesc="Rhino Linux branding for Lomiri Desktop"
maintainer=("Oren Klopfer <oren@taumoda.com>")
depends=("lomiri-schemas" "desktop-base" "dconf-gsettings-backend | gsettings-backend" "qmltermwidget-common")
pacdeps=("rhino-branding-git" "rhino-wallpapers-git" "rhino-kvantum-theme-git" "rhino-adwaita-theme-git")

pre_install() {
  sudo dpkg-divert --quiet --package "${gives}" --divert /usr/share/QMLTermWidget/color-schemes/Ubuntu-upstream.colorscheme --rename /usr/share/QMLTermWidget/color-schemes/Ubuntu.colorscheme
  for i in /usr/share/lomiri/Wizard/Pages/data/{Desktop_header_bkg,Desktop_splash_screen_bkg,Phone_header_bkg,Phone_splash_screen_bkg,Tick@30,timezonemap/pin}.png; do
    sudo dpkg-divert --quiet --package "${gives}" --divert "${i}".bak --rename "${i}"
  done
}

package() {
  install -Dm644 "${gives#rhino-}"/10_rhino-lomiri.gschema.override -t "${pkgdir}/usr/share/glib-2.0/schemas"
  install -Dm644 "${gives#rhino-}"/Rhino.colorscheme -t "${pkgdir}/usr/share/QMLTermWidget/color-schemes"
  ln -sf "/usr/share/QMLTermWidget/color-schemes/Rhino.colorscheme" "${pkgdir}/usr/share/QMLTermWidget/color-schemes/Ubuntu.colorscheme"
  install -Dm644 "${gives#rhino-}"/theme.ini -t "${pkgdir}/etc/skel/.config/lomiri-ui-toolkit"
  for i in "${gives#rhino-}"/wizard/{Desktop_header_bkg,Desktop_splash_screen_bkg,Phone_header_bkg,Phone_splash_screen_bkg,Tick@30}.png; do
    install -Dm644 "${i}" -t "${pkgdir}/usr/share/lomiri/Wizard/Pages/data"
  done
  install -Dm644 "${gives#rhino-}"/wizard/pin.png -t "${pkgdir}/usr/share/lomiri/Wizard/Pages/data/timezonemap"
}

post_install() {
  mkdir -p "${homedir}/.config/lomiri-ui-toolkit"
  if ! [[ -f "${homedir}/.config/lomiri-ui-toolkit/theme.ini" ]]; then
    sudo cp "/etc/skel/.config/lomiri-ui-toolkit/theme.ini" "${homedir}/.config/lomiri-ui-toolkit/theme.ini"
    sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/lomiri-ui-toolkit"
  fi
}

post_remove() {
  if ! [[ -d "${STAGEDIR}/${pkgname}" ]]; then
    sudo dpkg-divert --quiet --package "${gives}" --remove --rename /usr/share/QMLTermWidget/color-schemes/Ubuntu.colorscheme
    for i in /usr/share/lomiri/Wizard/Pages/data/{Desktop_header_bkg,Desktop_splash_screen_bkg,Phone_header_bkg,Phone_splash_screen_bkg,Tick@30,timezonemap/pin}.png; do
      sudo dpkg-divert --quiet --package "${gives}" --remove --rename "${i}"
    done
  fi
}
