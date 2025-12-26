pkgname="plexmediaserver-deb"
gives="plexmediaserver"
repology=("project: ${gives}")
pkgver="1.41.8.9834-071366d65"
replaces=("${gives}")
source=("https://downloads.plex.tv/plex-media-server-new/${pkgver}/debian/${gives}_${pkgver}_${CARCH}.deb")
pkgdesc="Plex organizes all of your personal media so you can easily access and enjoy it"
arch=('amd64' 'arm64')
sha256sums_amd64=("7e19bad6fc493966dada780bcc70acb2a48280ef491bbceeac127dd1f4a7012e")
sha256sums_arm64=("cd0947749ca8f43da466fb34288f426fb6320a119745efbde8cd978b5798c278")

maintainer=("Oren Klopfer <oren@taumoda.com>")
