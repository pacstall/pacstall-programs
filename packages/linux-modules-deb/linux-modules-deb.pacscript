name="linux-modules-deb"
gives="linux-modules-6.9.0-060900rc1-generic"
pkgver="6.9~rc1"
buildver="6.9.0-060900rc1.202403242136"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="7ed7cfb303370249566c6ac116e7388a05b6e4f501325c22f218cd50fef9d31f"
else
  hash="ee408d467f6bcd4fed847690a419f0118350e696c7aa45c50e9e110b7e28b8d7"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
