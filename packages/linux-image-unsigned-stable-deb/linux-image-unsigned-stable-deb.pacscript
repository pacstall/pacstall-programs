name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.6.0-060600-generic"
pkgver="6.6"
buildver="6.6.0-060600.202311151808"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="3f65582ab5d929e99502842c35b0541805985f45a0d3726029cb05137c742a34"
else
  hash="4534a0b1b8a27fad9d8a0d3f7daf198130f16d330327b533f510747926879ddd"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
