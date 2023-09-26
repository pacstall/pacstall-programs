name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.5.5-060505-generic"
pkgver="6.5.5"
buildver="6.5.5-060505.202309230703"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="5f6b42d8e8533eb5d6bb1c6f033b8eeb02e2bc369cb67dbbe5721fdde2e11800"
else
  hash="d8af95e9409e95b19e4daaf868d6668cc6d1705b99053c869677409662714388"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
