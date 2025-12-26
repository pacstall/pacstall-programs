pkgname="ticktick-deb"
gives="ticktick"
repology=("project: ticktick" "repo: aur")
arch=("amd64" "arm64")
pkgver="2.0.20"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
source_amd64=("https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-amd64.deb")
sha256sums_amd64=("e70e7440c48c9a4a6e8523aabf72e3adc4100f0683ee921d294a3ef18520be99")
source_arm64=("https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${pkgver}-arm64.deb")
sha256sums_arm64=("bbdb94189a93c2eb57ab3afa6c083c8ac68db5ac9d4cc8b4efd96a080dcfea9b")

url='https://ticktick.com'
pkgdesc="A powerful to-do & task management app with seamless cloud synchronization across all your devices"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")
