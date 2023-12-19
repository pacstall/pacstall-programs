name="linux-modules-stable-deb"
gives="linux-modules-6.6.7-060607-generic"
pkgver="6.6.7"
buildver="6.6.7-060607.202312131837"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="9770d403332bac63e7af1431e1e311f709a024a56c642e45060531ce7ba64bdb"
else
  hash="a8e877a8c81b9fe4d535d0324ca70f604e8d3f40f2ee22346e753fdb0695746e"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
