name="linux-modules-stable-deb"
gives="linux-modules-6.8.6-060806-generic"
pkgver="6.8.6"
buildver="6.8.6-060806.202404131135"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="4cb8f4118aa59a78bb64ae1ccb12532f411b2b4e0fc8b63ad6d14740f104a757"
else
  hash="f771e9c4c657ad863b73527944c077e69ba734c60d55ce898cccca41a3182c38"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
