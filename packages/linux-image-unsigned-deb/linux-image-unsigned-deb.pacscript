name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.6.0-060600rc2-generic"
pkgver="6.6-rc2"
buildver="6.6.0-060600rc2.202309171834"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="5c8dd82209c3f31d4438ea529f4d551bcb004d599053cb67b15a7a950c2ccba3"
else
  hash="c7a6ff039377c7d0539eb63ee5d44e5a2acfcd3b17d7a5b60a341a8578ace8b6"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
