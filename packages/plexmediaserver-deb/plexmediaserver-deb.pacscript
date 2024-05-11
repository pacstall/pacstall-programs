pkgname="plexmediaserver-deb"
gives="plexmediaserver"
repology=("project: ${gives}")
pkgver="1.32.0.6918-6f393eda1"
replaces=("${gives}")
source=("https://downloads.plex.tv/plex-media-server-new/${pkgver}/debian/${gives}_${pkgver}_${CARCH}.deb")
pkgdesc="Plex organizes all of your personal media so you can easily access and enjoy it"
arch=('amd64' 'arm64')
sha256sums_amd64=("f6b1a6524d26eed04b4a8e4b790d5fbf6ae798aed643d0150d43d4d1aa972eb3")
sha256sums_arm64=("abc3d990f19216711a7ae7562c506aded2fe74c7ba6bc616f92c8cf89c0da600")

maintainer=("Oren Klopfer <oren@taumoda.com>")
