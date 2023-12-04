name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.6.4-060604-generic"
pkgver="6.6.4"
buildver="6.6.4-060604.202312030734"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="25cc53308e2e7213c5b0ff24e4963858f32b107abca62f493fe1001e2f5e5613"
else
  hash="e0f9ab16e5666b26df09a16b8d74e9e3f7ad26869108650291b54a7efe9c23b4"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
