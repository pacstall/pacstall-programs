name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.4.10-060410-generic"
pkgver="6.4.10"
buildver="6.4.10-060410.202308111154"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="64ced8afcde7857cff16a0d46bb6ca148c91ee2ff8daf1572d274e3d6afce8f2"
else
  hash="5766b8255de2082c3b56b2abfa8e91207126176f5cd6cf964b200859831b5bb2"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
