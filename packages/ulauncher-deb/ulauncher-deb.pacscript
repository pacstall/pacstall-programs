pkgname="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta19"
arch=("all")
repology=("project: ${gives}")
depends=("gobject-introspection" "gir1.2-gtklayershell-0.1" "python3-xlib" "gir1.2-xapp-1.0" "xapps-common")
if [[ ! "devel noble oracular" =~ ${DISTRO#*:} ]]; then
  depends+=("python3-levenshtein")
fi
source=("https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb")
pkgdesc="Application launcher for Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums=("8d58845eeb1f01d04a3daf6efe42d8a063c34eb918c63a3f35c76ebc8836d411")
