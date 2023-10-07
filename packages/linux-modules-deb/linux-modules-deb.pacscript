name="linux-modules-deb"
gives="linux-modules-6.6.0-060600rc4-generic"
pkgver="6.6-rc4"
buildver="6.6.0-060600rc4.202310012130"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="570cd3b7f8ade45f4cf8b2efb7d44b933a9e336b1c3b071e76c0e2f9aeca6fa0"
else
  hash="6ae59f97132b5ee563eb98450bef398bfbb98613eb86a9e6e6b48e1f6dcac5f9"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
