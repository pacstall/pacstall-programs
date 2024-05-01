pkgname="veracrypt-deb"
repology=("project: veracrypt")
gives="veracrypt"
breaks=("${gives}" "${gives}-console" "${gives}-git")
pkgver="1.26.7"
codename=$(lsb_release -cs)
case "${codename}" in
  "jammy")
    distro="Ubuntu-22.04"
    sha256sums=("f0dca101cf5b5eccfadaad3f53aea037fd5a01cd9afeb7248ddcca28b821a0ef")
    ;;
  *)
    distro="Ubuntu-23.04"
    sha256sums=("fadb9116aba042d8d8b087c280e5b02798ac3d2f400d1d94bd791587245329d2")
    ;;
esac
source=("https://launchpad.net/veracrypt/trunk/${pkgver}/+download/veracrypt-${pkgver}-${distro}-amd64.deb")
pkgdesc="VeraCrypt is a free open source disk encryption software for Windows, Mac OSX and Linux"
arch=('amd64')
maintainer=("Zahrun <Zahrun@github.com>")
