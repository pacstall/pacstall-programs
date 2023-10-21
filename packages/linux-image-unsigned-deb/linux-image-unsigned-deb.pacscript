name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.6.0-060600rc5-generic"
pkgver="6.6-rc5"
buildver="6.6.0-060600rc5.202310081731"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="b0f8a07f377b14f1185451bcff98cddce5e44c42f30aae2791ab6a790574c880"
else
  hash="cc6646ddf760b47713566bd9b602dcef6b5fe67f104d2a44a4e06da7611b7eba"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
