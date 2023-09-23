name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.5.4-060504-generic"
pkgver="6.5.4"
buildver="6.5.4-060504.202309191142"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="a0c39eebb0f8272e15cf81b7d52812cb9596e2dbf1f2cfdf6b84dffaf8194761"
else
  hash="398742a328f9123aad6656087b368945a77263d8939e28bbc8e00b7547bc0b89"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
