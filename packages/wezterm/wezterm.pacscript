case $(grep -Po 'VERSION_CODENAME=\K[^"]+' /etc/os-release) in

bullseye)
  distro="Debian"
  distro_version="11"
  hash="0a440c7ad1b35a1df4c37a43551e7c26f1bcc44b211a3c057041be9c2c307c88"
;;
buster)
  distro="Debian"
  distro_version="10"
  hash="c31acd84e25d00fa5ddd6cdf1571c9ba17077c0509eb9816173ede4913059864"
;;
jammy)
  distro="Ubuntu"
  distro_version="22.04"
  hash="b2da0fdb33da62750431b6f131ebd5452bf05094e55934d8ca76d79a0e2e282b"
;;
focal)
  distro="Ubuntu"
  distro_version="20.04"
  hash="88c4f5ab8921e38756f6ba94bfb331a01fe42e1cfd0387566d7f51064451be2e"
;;
bionic)
  distro="Ubuntu"
  distro_version="18.04"
  hash="cd2faa1b2b54aae61ec39f0868af2120772b837472c49da14a9843bf05e55fda"
;;

*)
  distro="Ubuntu"
  distro_version="18.04"
  hash="cd2faa1b2b54aae61ec39f0868af2120772b837472c49da14a9843bf05e55fda"
;;
esac
echo $distro

name="wezterm-deb"
gives="wezterm"
version="20220905-102802-7d4b8249"
repology={"project: wezterm"}
url="https://github.com/wez/wezterm/releases/download/${version}/wezterm-${version}.${distro}${distro_version}.deb"
maintainer="awollgarten <awollgaren@posteo.net>"
description="WezTerm is a GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
hash=$hash
