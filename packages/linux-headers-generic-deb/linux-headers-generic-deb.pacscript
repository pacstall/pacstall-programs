name="linux-headers-generic-deb"
gives="linux-headers-6.8.0-060800rc6-generic"
pkgver="6.8-rc6"
buildver="6.8.0-060800rc6.202402251933"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="8681b600b9d75e4928c59e65499b8c7c4ff2c63b651c66b16ba2c8cfbe00ec3b"
else
  hash="4096aceb9c07e2affc4ebefe649bd5de576ddac57bc47e4fdad43f6e8869cdc8"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
