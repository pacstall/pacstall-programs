name="fsearch-deb"
gives="fsearch"
repology=("project: fsearch")
pkgver="0.2.2"
codename="$(lsb_release -cs)"
echo "Installing for ${codename}"
case "${codename}" in
  bullseye)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_11/amd64/fsearch_${pkgver}-1+3.4_amd64.deb"
    hash="c6f9c933b2dacc39af8a299aaf0787ac01fbd9849541b262da2d84b9c29d441a"
    ;;
  buster)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_10/amd64/fsearch_${pkgver}-1+3.2_amd64.deb"
    hash="3ed872432982114310d5cacb5dd873da47dd17801758eebfb8976250173e7d52"
    ;;
  jammy)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_Unstable/amd64/fsearch_${pkgver}-1+3.167_amd64.deb"
    pacdeps=("libicu-deb")
    hash="88d4f2632733dda4be5aa1a9dc522f71a1c074e0b47099cc8e32225365ed69a3"
    ;;
  *)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_Unstable/amd64/fsearch_${pkgver}-1+3.167_amd64.deb"
    hash="88d4f2632733dda4be5aa1a9dc522f71a1c074e0b47099cc8e32225365ed69a3"
    ;;
esac
pkgdesc="FSearch is a fast file search utility, inspired by Everything Search Engine"
maintainer="Zahrun <Zahrun@github.com>"
arch=('amd64')
