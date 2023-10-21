name="linux-headers-generic-stable-deb"
gives="linux-headers-6.5.6-060506-generic"
pkgver="6.5.6"
buildver="6.5.6-060506.202310061235"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="b1ab86c40e601771f0b3fbf544f2501ec1e428e548b829c070a22e1a758628ec"
else
  hash="19e6d63e4fa2f8b68cdfe833686d4b886b56ccf919a1038b4a9d093dce12d946"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
