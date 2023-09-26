name="linux-modules-stable-deb"
gives="linux-modules-6.5.5-060505-generic"
pkgver="6.5.5"
buildver="6.5.5-060505.202309230703"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="a1eab1e554e524b12cfd95ba50a04f4f4a3dfb1034e5d638917ebf4839273be5"
else
  hash="b5ef7a5e0a4e91e9227fd756c7965c1d55a46959ee134a635bf54440f7c008c0"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
