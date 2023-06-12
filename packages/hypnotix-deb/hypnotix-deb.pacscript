name="hypnotix-deb"
gives="hypnotix"
repology=("project: ${gives}")
codename="$(lsb_release -cs)"
pacdeps=("gir1.2-xapp-1.0-deb")
case "${codename}" in
  jammy)
    version="2.6"
    hash="e54ca3865d89a4ff4f84c922c55a0ee03523d6670fdb607434676a1bfa710de6"
    ;;
  *)
    version="3.4"
    hash="8da51e1b3522b6afff5f648a1f8bb99346c8573eaff040730497bb9c9cfc457e"
    ;;
esac
incompatible=("debian:bullseye" "debian:bookworm" "debian:sid" "ubuntu:lunar" "ubuntu:mantic")
url="http://packages.linuxmint.com/pool/main/h/hypnotix/hypnotix_${version}_all.deb"
description="An IPTV streaming application with support for live TV, movies and series"
maintainer="Zahrun <Zahrun@github.com>"
