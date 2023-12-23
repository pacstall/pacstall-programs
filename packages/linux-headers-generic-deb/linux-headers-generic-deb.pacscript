name="linux-headers-generic-deb"
gives="linux-headers-6.7.0-060700rc6-generic"
pkgver="6.7-rc6"
buildver="6.7.0-060700rc6.202312172332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d86821fba4385c4587f9e4fe430b9cf9fcd4b639e4b92aee06b02f260ad32e0d"
else
  hash="42a9f92468582a4fa6597f50117f7b2b9e057fa238249c060d46e1a666dd245d"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
