name="linux-modules-stable-deb"
gives="linux-modules-6.5.0-060500-generic"
pkgver="6.5.0"
buildver="6.5.0-060500.202308271831"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="beec910a3c3a13bb6e685b693881b624b911ca43efe4513efe8686f8fb4a8227"
else
  hash="8281bbf6baea639dd1e610cafce25eb167113277d6016b000def9561766d563f"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
