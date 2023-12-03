name="linux-headers-generic-deb"
gives="linux-headers-6.7.0-060700rc2-generic"
pkgver="6.7-rc2"
buildver="6.7.0-060700rc2.202311192332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="9d8af6652625dc901ac256018d1033846c03efa08e8bfc28eb872c7018a6ba0d"
else
  hash="ccfdfb365089f3d3f42aaa6fee0f1d3e8b4341aeabeb7c2416a0eb82c0417f14"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
