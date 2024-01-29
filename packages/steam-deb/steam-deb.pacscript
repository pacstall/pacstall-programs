name="steam-deb"
gives="steam"
pkgver="1.0.0.78"
pacdeps=("steam-launcher-deb")
breaks=("${gives}-bin" "${gives}-app")
replace=("${gives}")
depends=("software-properties-common")
url="https://repo.${gives}powered.com/${gives}/archive/stable/${gives}_${pkgver}_i386.deb"
pkgdesc="Steam is a video game digital distribution service by Valve"
hash="e177e195b6ccdb9ddd57151e6689c1f0e73b900197bd586cdb6d7187a9efd762"
repology=("project: ${gives}")
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"
pre_install() {
debian_version="$(cat /etc/os-release | grep VERSION_CODENAME | cut -d '=' -f 2)"

case $debian_version in
sid|unstable|testing|stable|Trixie|bookworm)
sudo add-apt-repository non-free -y
;;
esac

sudo dpkg --add-architecture i386
sudo apt-get update
}
