name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.8.6-060806-generic"
pkgver="6.8.6"
buildver="6.8.6-060806.202404131135"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="12fc6c9b326e80cef7e15ff44d0fd8d3378aea934f08e6263b11cd6e461fc90f"
else
  hash="cb93ebebdce6de9cbbeed02483b0c3e410732c1ec666343e945d8b1413e20aff"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
pacdeps=("linux-headers-generic-stable-deb" "linux-modules-stable-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
