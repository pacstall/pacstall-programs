name="linux-headers-generic-deb"
gives="linux-headers-6.7.0-060700rc4-generic"
pkgver="6.7-rc4"
buildver="6.7.0-060700rc4.202312031033"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="635a7459937401e5cbfc22f3945a40e215878ecea1a2890cfe7481c869213fbe"
else
  hash="ddabb6610415ce0b8c5d0041569a213f426bd052c177433a445d63ce6c7377be"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
