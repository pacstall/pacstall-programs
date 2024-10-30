pkgname="adw-gtk-theme"
arch=("all")
pkgver="1.1"
pkgdesc="LibAdwaita Theme for all GTK3 and GTK4 Apps
NOTE: This is a meta package which uses adw-gtk3 for GTK3 and official LibAdwaita theme for GTK4"
depends=("libadwaita-1-0")
pacdeps=("adw-gtk3")
source=(
  'extract-libadwaita-theme.'{hook,sh}
  'index.theme.'{light,dark}
)
sha256sums=(
  '477d83d73a19edee113a1161887f338ab1ea8496fbeaf653e8b47038ce6fa506'
  '130d4ba56c99793851b36826a6fd3359fef49ffff61dd41cf3d01ce4a5ee94ca'
  '4ef59f634c0d696a82851f89ef92798dfe554eedb2a514de469eb789016aed5a'
  '66e436ab0968d8c126fa7f274baa40cad2c36792fae3689e75c36231b0138063'
)
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  libalpmdir="${pkgdir}"/usr/share/libalpm
  install -Dm644 {"${srcdir}","${libalpmdir}/hooks"}/extract-libadwaita-theme.hook
  install -Dm755 {"${srcdir}","${libalpmdir}/scripts"}/extract-libadwaita-theme.sh
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
