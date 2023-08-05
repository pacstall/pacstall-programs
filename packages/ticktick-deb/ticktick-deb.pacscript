name="ticktick-deb"
gives="ticktick"
repology=("project: ticktick" "repo: aur")
pkgver="1.0.70"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libappindicator3-1" "libsecret-1-0")
case "${CARCH}" in
  amd64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-amd64.deb"
    hash="aa21ab7a1f83222334bc4bdedba7be4947a7a28d6dbc8ad35bc7033215fb6cfe"
    arch=("amd64")
    ;;
  arm64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-arm64.deb"
    hash="6eb079d8d59aa1684fbd3f8c575626bde46eb9df0fa335a8e01f8a86003b0419"
    arch=("arm64")
    ;;
  *)
    return 1
    ;;
esac
homepage="https://ticktick.com"
pkgdesc="A powerful to-do & task management app with seamless cloud synchronization across all your devices"
maintainer="Arrowsome <ramtintoosi@gmail.com>"
