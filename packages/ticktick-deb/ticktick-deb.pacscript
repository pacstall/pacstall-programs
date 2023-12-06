name="ticktick-deb"
gives="ticktick"
repology=("project: ticktick" "repo: aur")
pkgver="2.0.0"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
case "${CARCH}" in
  amd64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-amd64.deb"
    hash="2ce96561db5ef98fa96e35c8db3390af0a6d994a380a4e8ec98a045fab2e634f"
    arch=("amd64")
    ;;
  arm64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-arm64.deb"
    hash="a01587c471dfc06d88e5192eafa8584ea826a1b833ad91d65d1d7028ee2c5d65"
    arch=("arm64")
    ;;
  *)
    return 1
    ;;
esac
homepage="https://ticktick.com"
pkgdesc="A powerful to-do & task management app with seamless cloud synchronization across all your devices"
maintainer="Arrowsome <ramtintoosi@gmail.com>"
