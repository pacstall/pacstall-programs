name="ticktick-deb"
gives="ticktick"
repology=("project: ticktick" "repo: aur")
pkgver="1.0.80"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
case "${CARCH}" in
  amd64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-amd64.deb"
    hash="10afbc3451229b681c163f6de80198746565c858fd62aecd68e89add72b2ddc7"
    arch=("amd64")
    ;;
  arm64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-arm64.deb"
    hash="f1b30675fb745a33b56c70eb30941979513c46222bc084a8329cad2a1f9b760b"
    arch=("arm64")
    ;;
  *)
    return 1
    ;;
esac
homepage="https://ticktick.com"
description="A powerful to-do & task management app with seamless cloud synchronization across all your devices"
maintainer="Arrowsome <ramtintoosi@gmail.com>"
