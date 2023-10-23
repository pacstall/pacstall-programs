name="veracrypt-deb"
repology=("project: veracrypt")
gives="veracrypt"
breaks=("${gives}" "${gives}-console" "${gives}-git")
pkgver="1.26.7"
codename=$(lsb_release -cs)
case "${codename}" in
  "jammy")
    distro="Ubuntu-22.04"
    ;;
  *)
    distro="Ubuntu-23.04"
    ;;
esac
url="https://launchpad.net/veracrypt/trunk/${pkgver}/+download/veracrypt-${pkgver}-${distro}-amd64.deb"
pkgdesc="VeraCrypt is a free open source disk encryption software for Windows, Mac OSX and Linux"
hash="f0dca101cf5b5eccfadaad3f53aea037fd5a01cd9afeb7248ddcca28b821a0ef"
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"
