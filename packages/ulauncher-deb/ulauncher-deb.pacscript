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
url="https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver/\~/-}/${gives}_${pkgver/\~/.}_all.deb"
pkgdesc="Application launcher for Linux"
maintainer="Oren Klopfer <oren@taumoda.com>"
hash="bf10b2a00392d137b47e392c748caeed4aa70c5aed4c3e82e0c812f2f30b0a3e"
