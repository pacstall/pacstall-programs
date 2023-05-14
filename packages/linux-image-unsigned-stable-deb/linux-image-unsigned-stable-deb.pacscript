name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.3.2-060302-generic"
version="6.3.2"
buildver="6.3.2-060302.202305111150"
if [[ ${CARCH} == "arm64" ]]; then
  hash="eb0a4374dbf7269050023add97f426b886a43d57ffd1227ab5c30560f59290cb"
  arch=('arm64')
else
  hash="57c8ffcd8fd827986dd174b7860aa9c5103c3296a12e70d76c07b0d1c166343a"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
