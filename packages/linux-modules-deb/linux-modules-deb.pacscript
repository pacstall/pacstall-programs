name="linux-modules-deb"
gives="linux-modules-6.5.0-060500rc5-generic"
pkgver="6.5-rc5"
buildver="6.5.0-060500rc5.202308062330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="4779c718d0ecaae5468bbb5b1ea8da99d144e6c12ff6c52809e13f2373d9f2b8"
  arch=('arm64')
else
  hash="d7bc3b538965986a71b6bc3173b1af657f52b767279bee0b35e1d30e3bf81713"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
