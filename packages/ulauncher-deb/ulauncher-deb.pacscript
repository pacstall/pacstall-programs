name="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta10"
arch=("any")
repology=("project: ${gives}")
depends=("python3-all" "python-gi-dev" "gobject-introspection" "gir1.2-glib-2.0" "gir1.2-gtk-3.0" "gir1.2-webkit2-4.1" "gir1.2-gtklayershell-0.1" "gir1.2-gdkpixbuf-2.0" "python3-xlib" "gir1.2-xapp-1.0" "xapps-common")
case ${DISTRO} in
	"ubuntu:devel" | "ubuntu:noble") ;;
	*) depends+=("python3-levenshtein") ;;
esac
url="https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb"
pkgdesc="Application launcher for Linux"
maintainer="Oren Klopfer <oren@taumoda.com>"
hash="647cab272b85b0e54f16cafbb326c5c184867f659723c6ea4d3c62820765534d"
