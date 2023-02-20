name="hypnotix-deb"
gives="hypnotix"
repology=("project: ${gives}")
codename="$(lsb_release -cs)"
case "${codename}" in
  bullseye)
    pacdeps=("gir1.2-xapp-1.0-deb")
    ;;
  bookworm)
    pacdeps=("python3-imdbpy-deb")
    ;;
  *) ;;
esac
case "${codename}" in
  jammy)
    version="2.6"
    hash="e54ca3865d89a4ff4f84c922c55a0ee03523d6670fdb607434676a1bfa710de6"
    ;;
  *)
    version="3.2"
    hash="ba8661f56513bba7de2d48270aecf0b7e226807d8c6f6d898898edbc4ec14743"
    ;;
esac
incompatible=("debian:sid")
url="http://packages.linuxmint.com/pool/main/h/hypnotix/hypnotix_${version}_all.deb"
description="An IPTV streaming application with support for live TV, movies and series"
maintainer="Zahrun <Zahrun@github.com>"
