name="linux-headers-generic-stable-deb"
gives="linux-headers-6.8.0-060800-generic"
pkgver="6.8"
buildver="6.8.0-060800.202403131158"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="f810e63d590e69f05fe76404fef349de30783b064b35955cef1bc683cd9a98bf"
else
  hash="9fcf923491bbe863810ee117ff3dc0ed7f75d36b61b88c3c14a2363f571b6780"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
