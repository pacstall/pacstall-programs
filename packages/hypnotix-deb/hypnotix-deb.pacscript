name="hypnotix-deb"
gives="hypnotix"
repology=("project: ${gives}")
codename="$(lsb_release -cs)"
pacdeps=("gir1.2-xapp-1.0-deb" "circle-flags-svg-deb")
case "${codename}" in
  bullseye | bookworm | trixie)
    pacdeps=("gir1.2-xapp-1.0-deb" "python3-imdbpy-deb")
    ;;
  *) ;;
esac
pkgver="3.7"
hash="dde1d87e5f343c2b6ddedaa998c38242980cc406f4e0f54600433da4fc7d7ced"
url="http://packages.linuxmint.com/pool/main/h/hypnotix/hypnotix_${pkgver}_all.deb"
pkgdesc="An IPTV streaming application with support for live TV, movies and series"
maintainer="Zahrun <Zahrun@github.com>"
