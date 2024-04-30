name="linux-headers-generic-deb"
gives="linux-headers-6.9.0-060900rc6-generic"
pkgver="6.9~rc6"
buildver="6.9.0-060900rc6.202404282134"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d1c86c50221266aa98090b36e6d52d55a940e1bf10afda5e696b6ec0cf0f5db3"
else
  hash="481644182f853da3c41e91dc7f958c71eb8351859c59fbec6173a13176fdf311"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
pacdeps=("linux-headers-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
