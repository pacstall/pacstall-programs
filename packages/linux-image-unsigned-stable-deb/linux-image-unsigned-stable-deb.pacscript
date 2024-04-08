name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.8.4-060804-generic"
pkgver="6.8.4"
buildver="6.8.4-060804.202404041833"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="612a5efc62c00d2bd14f2b2ac3625162bbf68c308ef2e4acb76f1c58f34d2c7d"
else
  hash="e998537d534b6f6cfc3d7308740e228c4368c95d726198a94b4ff0f8d23ce126"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
pacdeps=("linux-headers-generic-stable-deb" "linux-modules-stable-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
