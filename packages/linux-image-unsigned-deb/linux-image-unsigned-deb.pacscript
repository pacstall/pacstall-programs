name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.5.0-060500rc5-generic"
pkgver="6.5-rc5"
buildver="6.5.0-060500rc5.202308062330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="feaf5f47c8500faaf9d9b1c867e7ef5e29819304244a2bcffde7b272e4cf29e1"
  arch=('arm64')
else
  hash="179725b9064f8d665352a5d76c0e1e5709b09fdc3d00416a4f16db1bfcd1aeaf"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
