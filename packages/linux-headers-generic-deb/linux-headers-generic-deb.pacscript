name="linux-headers-generic-deb"
gives="linux-headers-6.6.0-060600rc4-generic"
pkgver="6.6-rc4"
buildver="6.6.0-060600rc4.202310012130"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="f519205caff26652cd18c1cb34d467647236aa1bb0f9215cb51dc12c2940b392"
else
  hash="9b21a078f63fd7d9237a85b8badf4d49823a2caf87aee1d0786b3252a8dc5fb2"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
