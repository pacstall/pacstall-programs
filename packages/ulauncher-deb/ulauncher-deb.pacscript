pkgname="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta5"
arch=("any")
repology=("project: ${gives}")
depends=("python3-all" "python-gi-dev" "gobject-introspection" "gir1.2-glib-2.0" "gir1.2-gtk-3.0" "gir1.2-webkit2-4.0" "gir1.2-gtklayershell-0.1" "gir1.2-wnck-3.0" "gir1.2-xapp-1.0" "xapps-common")
case ${DISTRO} in
	"ubuntu:devel" | "ubuntu:noble") ;;
	*) depends+=("python3-levenshtein") ;;
esac
source=("https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb")
pkgdesc="Application launcher for Linux"
maintainer=("Oren Klopfer <oren@taumoda.com>")
sha256sums=("bf10b2a00392d137b47e392c748caeed4aa70c5aed4c3e82e0c812f2f30b0a3e")
