name="linux-headers-generic-stable-deb"
gives="linux-headers-6.8.6-060806-generic"
pkgver="6.8.6"
buildver="6.8.6-060806.202404131135"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="dad105d5848d92a27a710df28acc1553098f52cc199ee49042f02b625109b4e0"
else
  hash="2fb61fcb732a73f83a07f5d6c9ccbc62879f4fb7e25a85ed7a02cc6381eb3061"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
pacdeps=("linux-headers-stable-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
