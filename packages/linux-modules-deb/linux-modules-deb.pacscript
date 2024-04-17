name="linux-modules-deb"
gives="linux-modules-6.9.0-060900rc4-generic"
pkgver="6.9~rc4"
buildver="6.9.0-060900rc4.202404142134"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="4da313beb4bc236b182b1d305622e969c101e30ea0faf0212e4d86fd4bf82d3a"
else
  hash="c0f89d99138151e709d3bc249fd0a004d9087efa69ce933094aaf64bf4769aa1"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
