name="jellyfin-media-player-deb"
gives="jellyfin-media-player"
pkgver="1.9.1"
arch=('amd64')
breaks=("${name}-bin" "${name}" "${name}-app")
pkgdesc="Jellyfin desktop client using jellyfin-web with embedded MPV player"
codename="${DISTRO#*:}"
url="https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-${codename}.deb"
case "${codename}" in
"bookworm")
  hash="2eb9856dc6c7a62c5c635391dee8e5fb35bce06d5c6c132241523e4f04ad2416"
  ;;
"bullseye")
  hash="5cac8cdf9271abb14b3fab637d0ef5bc31415198d009417cfaf087cb4218a3cd"
  ;;
"focal")
  hash="208ead4276fca396d15af7e87df31621cad09fea0a58c3fb33d096febf111a28"
  ;;
"jammy")
  hash="1fcc64c2d24cf9d9f3c9b29416cbdb921c77bf4497d0be9be92af8b372b96c1b"
  ;;
"kinetic")
  hash="ebe627b4db2559f01c7c99f599fc0c5e59097b7ab5e9c168295f513d940a9267"
  ;;
*)
  #Use Bullseye
  url="https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-bullseye.deb"
  hash="5cac8cdf9271abb14b3fab637d0ef5bc31415198d009417cfaf087cb4218a3cd"
  ;;
esac
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"
repology=("project: ${gives}")

# vim:set ft=sh ts=2 sw=2 et:
