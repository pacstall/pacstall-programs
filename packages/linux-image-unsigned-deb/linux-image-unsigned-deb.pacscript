name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.5.0-060500rc4-generic"
pkgver="6.5-rc4"
buildver="6.5.0-060500rc4.202308041735"
if [[ ${CARCH} == "arm64" ]]; then
  hash="cc201ac9856f635b823bea16d9cc3e26c1207c9484e240893f2de0f37af57d54"
  arch=('arm64')
else
  hash="bda0be5cf5ce2d9eb6e22b3e860f29064c4115c785369f2b87f389495855457c"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
