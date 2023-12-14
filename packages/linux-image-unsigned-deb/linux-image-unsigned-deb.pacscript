name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.7.0-060700rc5-generic"
pkgver="6.7-rc5"
buildver="6.7.0-060700rc5.202312102332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="4c3d85f3af98caf90fe6915ce969223f68f3b8664995bd7f4b4366d52dc3b22d"
else
  hash="caa39d33b9180ad8fb7e4dc33dae2e28aaa0cc072ee58f6c9f99e0626cd80047"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
