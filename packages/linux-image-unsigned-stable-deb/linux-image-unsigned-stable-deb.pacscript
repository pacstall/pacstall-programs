name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.8.1-060801-generic"
pkgver="6.8.1"
buildver="6.8.1-060801.202403151937"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="61c45560a67915ae1ce40dcf2746b3172dfdd020a8b46cc96119f07fb2c3ad23"
else
  hash="bd252ca6417f40c66b93044d01122b3fcc0e6d997d0d7ce4d6d63b3269925457"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
pacdeps=("linux-headers-generic-stable-deb" "linux-modules-stable-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
