name="ulauncher-deb"
gives="ulauncher"
pkgver="6.0.0~beta5"
arch=("any")
repology=("project: ${gives}")
depends=("python3-pyinotify" "gir1.2-keybinder-3.0" "gir1.2-webkit2-4.0" "gir1.2-notify-0.7" "python3-websocket" "python3-xdg" "wmctrl")
case ${DISTRO} in
	"ubuntu:devel" | "ubuntu:noble") ;;
	*) depends+=("python3-levenshtein") ;;
esac
url="https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/-}_all.deb"
pkgdesc="Application launcher for Linux"
maintainer="Oren Klopfer <oren@taumoda.com>"
hash="ebf4b01bbde932685d569b756d8d3a5ab709be2a70c27f26a989ae0ba3c2c1a9"
