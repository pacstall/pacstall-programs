name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.5.0-060500-generic"
pkgver="6.5.0"
buildver="6.5.0-060500.202308271831"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="11df085deadb78aa1707d9c3bdd2d4e965529a2cf69658864b4885b4e9b4a3d0"
else
  hash="26a90c1279ada6fc9b7482231071519bbb13d0a8a3bc461dd402fe722d5fd6bd"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
