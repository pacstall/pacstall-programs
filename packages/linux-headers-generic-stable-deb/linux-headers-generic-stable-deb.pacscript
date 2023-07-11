name="linux-headers-generic-stable-deb"
gives="linux-headers-6.4.3-060403-generic"
version="6.4.3"
buildver="6.4.3-060403.202307110536"
if [[ ${CARCH} == "arm64" ]]; then
  hash="4b1f19328957f756f0f71f3b0165d7ad01b8e59dc582baa6e217a4a9156aea3d"
  arch=('arm64')
else
  hash="2da876a73674d37555b0778300be061b2dd583445af18a1afc7e60c13318dca3"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
