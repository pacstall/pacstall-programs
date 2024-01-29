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
prepare() {
debian_version="$(grep VERSION_CODENAME < /etc/os-release | cut -d '=' -f 2)"

case ${debian_version} in
sid|unstable|testing|stable|trixie|bookworm)
sudo add-apt-repository non-free -y
;;
*)
echo "Using Ubuntu"
;;
esac

sudo dpkg --add-architecture i386
sudo apt-get update
}
