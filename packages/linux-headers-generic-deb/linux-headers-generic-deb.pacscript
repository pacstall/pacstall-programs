name="linux-headers-generic-deb"
gives="linux-headers-6.9.0-060900rc1-generic"
pkgver="6.9~rc1"
buildver="6.9.0-060900rc1.202403242136"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="f0d98d46158656c27c26dc490ac123c0ab8004e914ac43fdd00e5faa04012d9c"
else
  hash="8a842be1a8370f61ee5bdeaf34c93aaf31593beec64746c945a0a1efe8217433"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
pacdeps=("linux-headers-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
