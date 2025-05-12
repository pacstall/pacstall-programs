pkgname="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta18"
arch=("all")
repology=("project: ${gives}")
depends=("gobject-introspection" "gir1.2-gtklayershell-0.1" "python3-xlib" "gir1.2-xapp-1.0" "xapps-common")
if [[ ! "devel noble oracular" =~ ${DISTRO#*:} ]]; then
  depends+=("python3-levenshtein")
fi
source=("https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb")
pkgdesc="Application launcher for Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums=("1c4b44b5c39ba865de250693c9b849f27be3ef600f127fc93bd69b73a1ebd266")
