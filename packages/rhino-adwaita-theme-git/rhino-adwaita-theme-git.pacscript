pkgname="rhino-adwaita-theme-git"
gives="${pkgname%-git}"
pacdeps=("adw-gtk-theme")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Rhino Linux Adwaita theme overrides"
source=("https://github.com/rhino-linux/AdwRhino.git")
arch=("all")
pkgver="0.0.1"
pkgrel="2"

pre_install() {
  for i in gtk-3.0 gtk-4.0; do
    sudo dpkg-divert --quiet --package "${gives}" --divert "/etc/skel/.config/${i}/gtk.css-divert" --rename "/etc/skel/.config/${i}/gtk.css"
  done
}

package() {
  mkdir -p "${pkgdir}/etc/skel/.config"
  cp -r AdwRhino/gtk-{3,4}.0 "${pkgdir}/etc/skel/.config"
}

post_install() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  for i in gtk-3.0 gtk-4.0; do
    if [[ -f "${homedir}/.config/${i}/gtk.css" && ! -f "${homedir}/.config/${i}/gtk.css-unicorn.bak" ]]; then
      mv "${homedir}/.config/${i}/gtk.css" "${homedir}/.config/${i}/gtk.css-unicorn.bak"
      cp -r "/etc/skel/.config/${i}" "${homedir}/.config"
    elif [[ ! -f "${homedir}/.config/${i}/gtk.css-unicorn.bak" ]]; then
      cp -r "/etc/skel/.config/${i}" "${homedir}/.config"
    fi
    sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/${i}"
  done
}

post_remove() {
  if ! [[ -d "${STAGEDIR}/${pkgname}" ]]; then
    for i in gtk-3.0 gtk-4.0; do
      sudo dpkg-divert --quiet --package "${gives}" --remove --rename "/etc/skel/.config/${i}/gtk.css"
    done
  fi
}
