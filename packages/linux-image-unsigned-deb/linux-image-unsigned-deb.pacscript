name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.5.0-060500rc7-generic"
pkgver="6.5-rc7"
buildver="6.5.0-060500rc7.202308201631"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="b5b6764fdbf8147dd26db00c4ff98043688b884f994901949eda04af950f1ab7"
else
  hash="b1b93354d43581b64607f4f98c2c434d28d3da00931361fa9ae787bed5f71d19"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
