name="linux-headers-generic-deb"
gives="linux-headers-6.7.0-060700-generic"
pkgver="6.7"
buildver="6.7.0-060700.202401072033"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="02d5b32f2da066abb891f704bc1b5e7a417b2e4ffce346ad0ef9eb8804d1061b"
else
  hash="52e495fde513ba49f0fbe2bcf005ac68c4ee787984960554dc31d3fe9edb2123"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
