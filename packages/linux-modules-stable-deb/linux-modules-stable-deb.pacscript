name="linux-modules-stable-deb"
gives="linux-modules-6.5.4-060504-generic"
pkgver="6.5.4"
buildver="6.5.4-060504.202309191142"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="83d8352be6e04882ba983ae425f4d1a8ca814d7600ecdfd7c4e0cae1ee30bd01"
else
  hash="d78f8f238242b9c2985dbb2637f74141769500521f6b3bf771444deba7c5f012"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
