pkgname="ticktick-deb"
gives="ticktick"
repology=("project: ticktick" "repo: aur")
pkgver="2.0.10"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
source_amd64=("https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-amd64.deb")
sha256sums_amd64=("c22827ed4d69e075fafd1c27326da255235a611867f086ba4107795fa9b70741")
source_arm64=("https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-arm64.deb")
sha256sums_arm64=("8e5c2ff5c9f223d5803b153a38ab34dbf326c6c4f107549df64fceb24f3a0521")

url="https://ticktick.com"
pkgdesc="A powerful to-do & task management app with seamless cloud synchronization across all your devices"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")
