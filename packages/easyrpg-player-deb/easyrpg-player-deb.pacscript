name="easyrpg-player-deb"
gives="easyrpg-player"
pkgver="0.8"
pkgdesc="RPG Maker 2000/2003 and EasyRPG games interpreter"
homepage="https://easyrpg.org"
arch=('amd64' 'i386')
url="https://download.opensuse.org/repositories/home:/easyrpg/Debian_11/${CARCH}/${gives}_${pkgver}-1_${CARCH}.deb"
case "${CARCH}" in
  arm64)
    hash="d7a40d62b13bb372f5393f15ba1f19efb41dc70412ae610d775be40e8b113f0c" ;;
  i386)
    hash="4e0dbda81a775b264158eab03783d77bcbcea6e0d87b82fe0770bf738a152f89" ;;
  *) ;;
esac
maintainer="vigress8 <vig@disroot.org>"
repology=("project: ${gives}")
