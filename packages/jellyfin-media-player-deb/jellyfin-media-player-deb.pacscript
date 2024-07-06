pkgname="jellyfin-media-player-deb"
gives="jellyfin-media-player"
pkgver="1.11.1"
arch=('amd64')
breaks=("${pkgname}-bin" "${pkgname}" "${pkgname}-app")
incompatible=("debian:sid")
pkgdesc="Jellyfin desktop client using jellyfin-web with embedded MPV player"
source_trixie=("https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-trixie.deb")
sha256sums_trixie=("fb246b38aeea7e6ba999ac7018fd12e6f37859ffb577b45ead414fad28655123")
source_noble=("https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-noble.deb")
sha256sums_noble=("a8ac03f054b7da418249b4ed32033eea146d7ca5d08fa4e3bd33ee5e36048c5d")
source_mantic=("https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-mantic.deb")
sha256sums_mantic=("51000d6c14e67dff72c9a026f67005afca1970af6e658cf8adc26637a6c1118a")
source_bookworm=("https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-bookworm.deb")
sha256sums_bookworm=("eed40a2a2c10bdae4d7b1ecb2a8dfa8dd22e90916273087e1b9836182dee315c")
source=("https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-jammy.deb")
sha256sums=("e5aa0c7fbb093ac519c1041873571baa2c5bbb6fdd7db16430be15c291f770c7")
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>")
repology=("project: ${gives}")

# vim:set ft=sh ts=2 sw=2 et:
