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
version="3.4"
hash="144b297472a81009b50737942c77ca1db0bc21a94ce2261d7b700e9059e66afa"
url="https://github.com/Zahrun/hypnotix/releases/download/${version}/hypnotix_${version}_all.deb"
description="An IPTV streaming application with support for live TV, movies and series"
maintainer="Zahrun <Zahrun@github.com>"
