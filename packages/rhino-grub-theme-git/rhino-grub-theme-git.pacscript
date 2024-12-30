pkgname="rhino-grub-theme-git"
gives="rhino-grub-theme"
source=("${gives}::https://github.com/rhino-linux/grub.git")
arch=("all")
pkgver="0.0.1"
pkgdesc="Custom Grub Loader theme for Rhino Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  mkdir -p "${pkgdir}/usr/share/grub/themes/rhino"
  cp -r "${gives}"/* "${pkgdir}/usr/share/grub/themes/rhino"
}

post_install() {
  echo "====================================================================="
  echo "To enable this theme, add the following line to '/etc/default/grub':"
  echo "GRUB_THEME=/usr/share/grub/themes/rhino/theme.txt"
  echo "Then, run 'sudo update-grub' and reboot."
  echo "====================================================================="
}
