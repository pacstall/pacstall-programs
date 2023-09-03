name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.5.1-060501-generic"
pkgver="6.5.1"
buildver="6.5.1-060501.202309020842"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="e33a38f490d13e247e211b8707a41c6d9a6023319b3882fbcd0ed4e9973e7212"
else
  hash="d591f9e13310226b8224d48cc09a9eae9af03dfb857b82bc35bc981ba663506d"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
