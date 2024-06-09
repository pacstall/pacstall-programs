pkgname="adw-gtk-theme"
pkgver="1.1"
pkgdesc="LibAdwaita Theme for all GTK3 and GTK4 Apps
NOTE: This is a meta package which uses adw-gtk3 for GTK3 and official LibAdwaita theme for GTK4"
depends=("libadwaita")
pacdeps=("adw-gtk3")
source=(
  'extract-libadwaita-theme.'{hook,sh}
  'index.theme.'{light,dark}
)
md5sums=(
  '328eb9f69bf98566a5c4d55e0fdff3c3'
  'c65c89f2a735b088ed599853f53074bd'
  '16ace27d8e4e79f3d1ba92c1a2c071ad'
  '895d966bc68af8df0b9c0c85d8b29335'
)
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  local libalpmdir="${pkgdir}"/usr/share/libalpm
  install -Dm644 {"${srcdir}","$libalpmdir/hooks"}/extract-libadwaita-theme.hook
  install -Dm755 {"${srcdir}","$libalpmdir/scripts"}/extract-libadwaita-theme.sh
  install -Dm644 "${srcdir}"/index.theme.light "${pkgdir}"/usr/share/themes/Adw/index.theme
  install -Dm644 "${srcdir}"/index.theme.dark "${pkgdir}"/usr/share/themes/Adw-dark/index.theme
}

post_install() {
  mkdir -p /usr/share/themes/Adw{,-dark}
  ln -sfrT /usr/share/themes/{adw-gtk3,Adw}/gtk-3.0
  ln -sfrT /usr/share/themes/{adw-gtk3,Adw}-dark/gtk-3.0
}

pre_remove() {
  rm -rf /usr/share/themes/Adw{,-dark}/gtk-{3,4}.0
}