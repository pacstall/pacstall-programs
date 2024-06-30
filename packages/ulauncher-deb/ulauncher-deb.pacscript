pkgname="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta13"
arch=("any")
repology=("project: ${gives}")
depends=("gobject-introspection" "gir1.2-gtklayershell-0.1" "python3-xlib" "gir1.2-xapp-1.0" "xapps-common")
if [[ ! "devel noble oracular" =~ ${DISTRO#*:} ]]; then
  depends+=("python3-levenshtein")
fi
source=("https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb")
pkgdesc="Application launcher for Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums=("2ff44b464318128b291cab4dad2bd8e107ada392169bcfe0bf5753b387ffe485")
