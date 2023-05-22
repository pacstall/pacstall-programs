name="linux-headers-generic-deb"
gives="linux-headers-6.4.0-060400rc1-generic"
version="6.4-rc1"
buildver="6.4.0-060400rc1.202305072134"
if [[ ${CARCH} == "arm64" ]]; then
  hash="105b9fbb8425f86be67df02164bc6b9f28adfe1afaeb4eee258a6c8684295f06"
  arch=('arm64')
else
  hash="5f74576740f976c1e96cd48c0937c7941fb00a4eb68cd24a419a36afb979817b"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
