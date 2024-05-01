pkgname="hypnotix-deb"
gives="hypnotix"
repology=("project: ${gives}")
codename="$(lsb_release -cs)"
pacdeps=("gir1.2-xapp-1.0-deb" "circle-flags-svg-deb")
case "${codename}" in
  bullseye | bookworm | trixie)
    pacdeps=("gir1.2-xapp-1.0-deb" "circle-flags-svg-deb" "python3-imdbpy-deb")
    ;;
  *) ;;
esac
pkgver="4.3"
sha256sums=("129f9fd5032252cebbd81a6ea8da4f61dc6bd4d9072dede430bfca8e67451361")
source=("http://packages.linuxmint.com/pool/main/h/hypnotix/hypnotix_${pkgver}_all.deb")
pkgdesc="An IPTV streaming application with support for live TV, movies and series"
maintainer=("Zahrun <Zahrun@github.com>")
