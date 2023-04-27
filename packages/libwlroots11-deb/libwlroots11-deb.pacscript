name="libwlroots11-deb"
gives="libwlroots11"
replace=("${gives}")
version="0.16.2-1"
description="a set of pluggable, composable modules to build a Wayland compositor"
maintainer="oklopfer <oren@taumoda.com>"
repology=("project: libwlroots11")
url="http://ftp.us.debian.org/debian/pool/main/w/wlroots/${gives}_${version}_${CARCH}.deb"
case "${CARCH}" in
  amd64)
    hash="842f3490d5a02f17d8ad74b73f26ee25bed37c2844d28dd75f4cbb85ff2bd1d0"
    arch=("amd64")
    ;;
  *)
    hash="e7ebb4e196ae20e172fe9559c52434d5c2635c66db7faad65566c3938d1137d3"
    arch=('arm64')
    ;;
esac