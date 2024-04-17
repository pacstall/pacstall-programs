name="linux-headers-generic-deb"
gives="linux-headers-6.9.0-060900rc4-generic"
pkgver="6.9~rc4"
buildver="6.9.0-060900rc4.202404142134"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="438e49e7db0f9b2a6b7afd6d95e8cb479d5fc0f8e3340d0a3a3d8433be1caf94"
else
  hash="bb04ee96c943fba64c9c7ec58c0e6325076a30fd8de1e90b5c98a7562416b7a3"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
pacdeps=("linux-headers-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
