name="linux-modules-stable-deb"
gives="linux-modules-6.4.9-060409-generic"
pkgver="6.4.9"
buildver="6.4.9-060409.202308081548"
if [[ ${CARCH} == "arm64" ]]; then
  hash="3c89e379b919611563d362762fa3ab36dfa9d10eb565c62508f144380adca487"
  arch=('arm64')
else
  hash="cbbdd8b1768e9d9446581ac07f365b118a88104ad9bd8b66648b66fb67f3d961"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
