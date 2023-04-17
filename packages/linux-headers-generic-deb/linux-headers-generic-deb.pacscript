name="linux-headers-generic-deb"
gives="linux-headers-6.3.0-060300rc7-generic"
version="6.3.0-rc7"
buildver="6.3.0-060300rc7.202304162330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="1bbe8c36a9544a5897322e632ce8620a6264a610d4da1cc10dffeb60c57cd5f5"
  arch=('arm64')
else
  hash="e54839d75aef125e69ee4fd02da0da43a8456344bc6438e2cc099d77095e9a8c"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
