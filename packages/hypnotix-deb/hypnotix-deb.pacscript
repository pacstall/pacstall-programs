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
    version="3.1"
    hash="436f479de5bec5e4191e5864d1655ff226d2b571c1837c4e03b816a54d118d3a"
    ;;
esac
url="http://packages.linuxmint.com/pool/main/h/hypnotix/hypnotix_${version}_all.deb"
description="An IPTV streaming application with support for live TV, movies and series"
maintainer="Zahrun <Zahrun@github.com>"
