name="linux-headers-generic-stable-deb"
gives="linux-headers-6.4.10-060410-generic"
pkgver="6.4.10"
buildver="6.4.10-060410.202308111154"
if [[ ${CARCH} == "arm64" ]]; then
  hash="ff408bfbdc8e58514081e0457d97182f6c4ba646727bbf9f01882316860795f0"
  arch=('arm64')
else
  hash="3c3a322f77e17adf143d6840cd33870ef4469960db936fa13322a6f790c1e727"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
