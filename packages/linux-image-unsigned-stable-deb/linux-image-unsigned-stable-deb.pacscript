name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.5.6-060506-generic"
pkgver="6.5.6"
buildver="6.5.6-060506.202310061235"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="17fde59dbeb70cd578c8efb03bae3104a060a0d527ad3ed91206b021a0112d68"
else
  hash="0675badb0153214db539c880997c18c60aad7d94016178b17a857523ff04d04f"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
