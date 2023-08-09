name="linux-headers-generic-deb"
gives="linux-headers-6.5.0-060500rc5-generic"
pkgver="6.5-rc5"
buildver="6.5.0-060500rc5.202308062330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="3906ea609a156881dd7c2f3b3f4d72acf5f2547ce6c42e96b914cc87cb78dc60"
  arch=('arm64')
else
  hash="9986ddc2c3c912cf41ec50cc10085a53d7b5f938f30999024fad727c5f3998e2"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
