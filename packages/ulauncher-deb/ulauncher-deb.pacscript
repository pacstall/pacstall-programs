pkgname="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta20"
arch=("all")
repology=("project: ${gives}")
depends=("gobject-introspection" "gir1.2-gtklayershell-0.1" "python3-xlib" "gir1.2-xapp-1.0" "xapps-common")
if [[ ! "devel noble oracular" =~ ${DISTRO#*:} ]]; then
  depends+=("python3-levenshtein")
fi
source=("https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb")
pkgdesc="Application launcher for Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums=("15c18e8acdc9845a90f133da112cbcd9e0d94db86b749f56c7ee967fb72721cb")
