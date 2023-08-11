name="linux-modules-stable-deb"
gives="linux-modules-6.4.10-060410-generic"
pkgver="6.4.10"
buildver="6.4.10-060410.202308111154"
if [[ ${CARCH} == "arm64" ]]; then
  hash="7353c6f083f23390d50193a465da04e97437d87e590069ae42b8ddb918db3cea"
  arch=('arm64')
else
  hash="33cf7dc0b61b5e880ae43e5d3e22369b0d21a3ab5b20044927efb3e06bfb35be"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
