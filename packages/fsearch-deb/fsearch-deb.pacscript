pkgname="fsearch-deb"
gives="fsearch"
repology=("project: fsearch")
pkgver="0.2.3"
codename="$(lsb_release -cs)"
echo "Installing for ${codename}"
case "${codename}" in
  bullseye)
    source=("https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_11/amd64/fsearch_${pkgver}-1+3.1_amd64.deb")
    sha256sums=("1ecaacb7e1f2b3eab3c15c7307bab0cbea9c0a8aa32ffc195e0d354a86d3a0f6")
    ;;
  bookworm)
    source=("https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_12/amd64/fsearch_${pkgver}-1+3.1_amd64.deb")
    sha256sums=("2f8b3b9a0153499b161866df64e081777f9085c789911817178986d96c220fcb")
    ;;
  jammy)
    source=("https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_12/amd64/fsearch_${pkgver}-1+3.1_amd64.deb")
    sha256sums=("2f8b3b9a0153499b161866df64e081777f9085c789911817178986d96c220fcb")
    pacdeps=("libicu-deb")
    ;;
  *)
    source=("https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_Unstable/amd64/fsearch_${pkgver}-1+3.15_amd64.deb")
    sha256sums=("40d5453743c8bca6e15a80b6d4d035594d6629048c98b07c1d30d61a182eebd8")
    ;;
esac
pkgdesc="FSearch is a fast file search utility, inspired by Everything Search Engine"
maintainer=("Zahrun <Zahrun@github.com>")
arch=('amd64')
