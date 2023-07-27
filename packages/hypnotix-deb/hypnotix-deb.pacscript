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
version="3.5"
hash="26f5d5fb37efb4170176e3512de3235957d3ac32f9e8e3cabc940c6aa94d234b"
url="https://github.com/Zahrun/hypnotix/releases/download/${version}/hypnotix_${version}_all.deb"
description="An IPTV streaming application with support for live TV, movies and series"
maintainer="Zahrun <Zahrun@github.com>"
