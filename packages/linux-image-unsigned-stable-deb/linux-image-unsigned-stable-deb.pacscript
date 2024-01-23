name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.7.1-060701-generic"
pkgver="6.7.1"
buildver="6.7.1-060701.202401201133"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="26d1477c06aa6daad10dd8e1931c3322f396ee7ad0d25cc305bacd2cbcfabc99"
else
  hash="a0a73fb211fcc2dd4693bd97265f3b7f58e04c710e2b28f7a3186ba9138336b9"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
