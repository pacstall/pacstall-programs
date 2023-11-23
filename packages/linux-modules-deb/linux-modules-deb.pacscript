name="linux-modules-deb"
gives="linux-modules-6.7.0-060700rc2-generic"
pkgver="6.7-rc2"
buildver="6.7.0-060700rc2.202311192332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="1e292622dc419bb2579abe787df62dc6a95c15a3756574b697f7cc7b49be9cad"
else
  hash="b15bb75d9d202d0686600c2a6cf2213e6fab0710237e207cd7fb5ecc878cc22b"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
