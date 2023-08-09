name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.4.9-060409-generic"
pkgver="6.4.9"
buildver="6.4.9-060409.202308081548"
if [[ ${CARCH} == "arm64" ]]; then
  hash="3235e06a4dba2f67a17a484a252a1ca48082b4f77fe3e6e32d592653ea695731"
  arch=('arm64')
else
  hash="4ba96d4dfc470064e4a42f0af8afe5c6a0413883673eb7a736f84f2546736fe6"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
