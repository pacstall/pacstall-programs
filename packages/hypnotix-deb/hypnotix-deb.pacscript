name="hypnotix-deb"
gives="hypnotix"
repology=("project: ${gives}")
codename="$(lsb_release -cs)"
pacdeps=("gir1.2-xapp-1.0-deb")
case "${codename}" in
  bullseye | bookworm)
    pacdeps=("gir1.2-xapp-1.0-deb" "python3-imdbpy-deb")
    ;;
  *) ;;
esac
pkgver="3.6"
hash="22173ffdced6a22f3b048a66ce3bfdaec1b67de948c2fab3d74bcbce46361f3a"
url="http://packages.linuxmint.com/pool/main/h/hypnotix/hypnotix_${pkgver}_all.deb"
pkgdesc="An IPTV streaming application with support for live TV, movies and series"
maintainer="Zahrun <Zahrun@github.com>"
