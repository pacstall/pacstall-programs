name="linux-headers-generic-stable-deb"
gives="linux-headers-6.8.1-060801-generic"
pkgver="6.8.1"
buildver="6.8.1-060801.202403151937"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="e71637fba22200e2e48815d3fd22505557e6bc59ca9c92309e842f795db7f9b6"
else
  hash="1aaac0aa45d7c04c8ab34465bdab49bc48d95a8a0ab6b73a5b8254528980c03f"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
