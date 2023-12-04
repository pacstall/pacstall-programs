name="linux-headers-generic-stable-deb"
gives="linux-headers-6.6.4-060604-generic"
pkgver="6.6.4"
buildver="6.6.4-060604.202312030734"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="be64427886b3c2be3d4e0c209a0fd7ee1b20b182d2adb8147df4fa1216842835"
else
  hash="5021276d92dc5f1feae25b5313da4a91b06dc87e0011878b8392323a944b85ef"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
