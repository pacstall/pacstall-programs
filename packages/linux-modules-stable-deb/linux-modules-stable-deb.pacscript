name="linux-modules-stable-deb"
gives="linux-modules-6.8.1-060801-generic"
pkgver="6.8.1"
buildver="6.8.1-060801.202403151937"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="ef9bb3ba6594bbbd7752a73e5e2febc63d5a7befd8ed7d1ff204743582437650"
else
  hash="69f4b67c07f873104d85f4adec31a5261845666f389601f4e004251f9f8a3961"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
