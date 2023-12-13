name="linux-headers-generic-stable-deb"
gives="linux-headers-6.6.6-060606-generic"
pkgver="6.6.6"
buildver="6.6.6-060606.202312111032"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="ebbdffa625b761f8aa450ac1f839a71a12a7bce64e3c3df31c500e0eff60108a"
else
  hash="fde7e4f7d7ae2a1a264b5b723edf5b77953be1f142c78bbe9b26e2674990ed60"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
