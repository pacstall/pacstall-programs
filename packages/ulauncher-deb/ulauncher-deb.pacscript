pkgname="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta16"
arch=("all")
repology=("project: ${gives}")
depends=("gobject-introspection" "gir1.2-gtklayershell-0.1" "python3-xlib" "gir1.2-xapp-1.0" "xapps-common")
if [[ ! "devel noble oracular" =~ ${DISTRO#*:} ]]; then
  depends+=("python3-levenshtein")
fi
source=("https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb")
pkgdesc="Application launcher for Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums=("a1ea338d32d0a2fc2ad740c16f7e3a4b220d192f3d8af3b1ba7ff361f0d624a1")
