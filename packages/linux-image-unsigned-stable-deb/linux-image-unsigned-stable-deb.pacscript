name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.8.8-060808-generic"
pkgver="6.8.8"
buildver="6.8.8-060808.202404271536"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="18df1b21d917943f1efd9bc32402e4abdb2d8387690842a5ff87424d044eda42"
else
  hash="4afc3f3bfa3a8a8d2f9d9181f6a45ba9f9f62a80720a3ca678a2177fa038a3e3"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
pacdeps=("linux-headers-generic-stable-deb" "linux-modules-stable-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
