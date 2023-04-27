name="libwlroots-dev-deb"
gives="libwlroots-dev"
replace=("${gives}")
version="0.16.2-1"
description="development files for wlroots"
maintainer="oklopfer <oren@taumoda.com>"
repology=("project: libwlroots11")
url="http://ftp.us.debian.org/debian/pool/main/w/wlroots/${gives}_${version}_${CARCH}.deb"
case "${CARCH}" in
  amd64)
    hash="4ef4cf0a97b7d5352d64e2634632cf9eb79b2594cd6aee66fc31ffbad1cf5b6c"
    arch=("amd64")
    ;;
  *)
    hash="07057a2801bbef6b48ac8b985504e6831f220c41521beb85436b5127360ccdec"
    arch=('arm64')
    ;;
esac