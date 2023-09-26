name="linux-headers-generic-stable-deb"
gives="linux-headers-6.5.5-060505-generic"
pkgver="6.5.5"
buildver="6.5.5-060505.202309230703"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="e2702d24649c418ad82feb99849f7aacc7b4b193ef3ac9aa10d91035fc59f1e1"
else
  hash="701959239184ec36821bf5e3b3239f0014ac7a10e4e4a0d514c0da02df51d903"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
