name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.7.0-060700rc6-generic"
pkgver="6.7-rc6"
buildver="6.7.0-060700rc6.202312172332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="909bf62992d610119a5aa421810375d3572b00c71a6631ac54bf5bbf7421c3ff"
else
  hash="b393dd1c78e96e708658884fc52b382ff0d411596e694ea19794a01036815fb5"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
