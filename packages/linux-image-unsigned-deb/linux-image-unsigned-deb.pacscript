name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.6.0-060600rc4-generic"
pkgver="6.6-rc4"
buildver="6.6.0-060600rc4.202310012130"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="f9b1485bc36c261161136b014877a3b1cc281f89d5d4aa91ae11c6e5c86797cf"
else
  hash="13eb2e28415d3afdcd43f043e0ef0cf220758bd558d20e4768a78756dbd571c0"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
