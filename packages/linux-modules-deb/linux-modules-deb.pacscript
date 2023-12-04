name="linux-modules-deb"
gives="linux-modules-6.7.0-060700rc4-generic"
pkgver="6.7-rc4"
buildver="6.7.0-060700rc4.202312031033"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="6a3040a84b9dba1d8a5c2bbd65756cf6fa8196a8f441fe0b97be39edea660da1"
else
  hash="05fba444d299520b5392989a772f2558452ed13ef6b9ef8e323683afdd77ca78"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
