name="linux-headers-generic-stable-deb"
gives="linux-headers-6.7.1-060701-generic"
pkgver="6.7.1"
buildver="6.7.1-060701.202401201133"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d52cf1681de4aaff19fb921d2821e6ff99031878ef01642e96e1247142fb4d60"
else
  hash="5caee983a7217f9b89b7afb2c04809cdde264380d7645710778dba51191a17dd"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
