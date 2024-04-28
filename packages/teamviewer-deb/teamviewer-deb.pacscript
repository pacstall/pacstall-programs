name="teamviewer-deb"
pkgname="teamviewer"
gives="teamviewer"
pkgver="15.53.6"
repology=("project: teamviewer")
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
depends=("libqt5x11extras5" "libqt5quickcontrols2-5" "libqt5webengine5" "libqt5svg5" "hicolor-icon-theme")
arch=('amd64' 'arm64')
case "${CARCH}" in
amd64)
  hash='9955eb3241b2684cae7845ae93102ffb41a8e176b52100a3973eb047667ceae3'
  ;;
arm64)
  hash='dd429662e8c72590d819fe73a27bcb99fc98348d8db38d20c595b26648430efd'
  ;;
*) ;;
esac
url="https://download.teamviewer.com/download/linux/teamviewer_${CARCH}.deb"
pkgdesc="Application for remote desktop sharing and online meetings"
license="custom"
maintainer="heyzsh <haidarzsh@gmail.com>"
