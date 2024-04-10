name="linux-modules-deb"
gives="linux-modules-6.9.0-060900rc3-generic"
pkgver="6.9~rc3"
buildver="6.9.0-060900rc3.202404072033"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d5a6f77bc519367916a30358d627d9013986c8d30f7cd7af53b1cd874bd44805"
else
  hash="d11c78acdf545735343bc9d2c5afab01461358c82f70747e3fdd31bb4b9c5f40"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
