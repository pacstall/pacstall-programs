name="linux-modules-deb"
gives="linux-modules-6.4.0-060400-generic"
version="6.4"
buildver="6.4.0-060400.202306271339"
if [[ ${CARCH} == "arm64" ]]; then
  hash="1c7a605265f6970ef2e75c4b7d3f93b6d504c4964be4a3f526b2b39a3c2a7ac2"
  arch=('arm64')
else
  hash="afb4e0f983125d0d7d0c57debd78ae462921e59da1034fc53e7905b6348c7dd7"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
