name="linux-headers-generic-deb"
gives="linux-headers-6.6.0-060600rc5-generic"
pkgver="6.6-rc5"
buildver="6.6.0-060600rc5.202310081731"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="6b4adadbe24c5b8d883d2ecf9bfa592dd28013d2da3b2e07ae58c863942e6e28"
else
  hash="623c3294e7f12f5e19c74899c4425d1fad6b0f320957c76125e3c04cdbb3e1b4"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
