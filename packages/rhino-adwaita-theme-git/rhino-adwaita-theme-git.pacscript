pkgname="rhino-adwaita-theme-git"
gives="${pkgname%-git}"
pacdeps=("adw-gtk-theme")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Rhino Linux Adwaita theme overrides"
source=("https://github.com/rhino-linux/AdwRhino.git")
arch=("all")
pkgver="0.0.1"

package() {
  mkdir -p "${pkgdir}/usr/share/branding/rhino"
  cp -r AdwRhino/gtk-{3,4}.0 "${pkgdir}/usr/share/branding/rhino"
}
