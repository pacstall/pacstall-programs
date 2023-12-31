name="plexmediaserver-deb"
gives="plexmediaserver"
repology=("project: ${gives}")
pkgver="1.32.0.6918-6f393eda1"
replace=("${gives}")
url="https://downloads.plex.tv/plex-media-server-new/${pkgver}/debian/${gives}_${pkgver}_${CARCH}.deb"
pkgdesc="Plex organizes all of your personal media so you can easily access and enjoy it"
case "${CARCH}" in
  amd64)
    hash="f6b1a6524d26eed04b4a8e4b790d5fbf6ae798aed643d0150d43d4d1aa972eb3"
    arch=('amd64')
    ;;
  arm64)
    hash="abc3d990f19216711a7ae7562c506aded2fe74c7ba6bc616f92c8cf89c0da600"
    arch=('arm64')
    ;;
  *) return 1 ;;
esac
maintainer="Oren Klopfer <oren@taumoda.com>"
