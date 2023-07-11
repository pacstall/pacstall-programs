name="linux-modules-stable-deb"
gives="linux-modules-6.4.3-060403-generic"
version="6.4.3"
buildver="6.4.3-060403.202307110536"
if [[ ${CARCH} == "arm64" ]]; then
  hash="c0fe236baa5430de4b23b428b4a1b4426bce68c54058fb2227d53c2bb72bb613"
  arch=('arm64')
else
  hash="3b9ba586a33eb67921a40e078646a50b8a48e7792f5a1f386be8712c882ad642"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
