name="linux-headers-generic-stable-deb"
gives="linux-headers-6.4.9-060409-generic"
pkgver="6.4.9"
buildver="6.4.9-060409.202308081548"
if [[ ${CARCH} == "arm64" ]]; then
  hash="ba187d76f432631f801759568ea45277ab09ad313e4a4dfa3683212fbce95057"
  arch=('arm64')
else
  hash="72ea0aca8c39ecd056ea7a97f4d236ba687ff052cda9f2edd54b727d6c5eaee4"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
