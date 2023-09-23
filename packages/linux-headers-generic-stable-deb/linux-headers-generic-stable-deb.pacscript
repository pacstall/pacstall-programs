name="linux-headers-generic-stable-deb"
gives="linux-headers-6.5.4-060504-generic"
pkgver="6.5.4"
buildver="6.5.4-060504.202309191142"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="ec858702aaf4fe181099e876567ba65a912034d52ce694b2cdaabe7f2906b5c1"
else
  hash="66cece98b43aa66f3197001c6dfc4e69e7dc4b4a9469fa24e8dcc09f30418b68"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
